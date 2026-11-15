import importlib.util, random, tempfile, unittest, sys
from pathlib import Path
SCRIPT=Path("SUNO_WORKDESKS/SUNO_LLM_WORKSHOP_v0.1/tools/random_hopper_compiler.py")
spec=importlib.util.spec_from_file_location("hopper_compiler",SCRIPT)
module=importlib.util.module_from_spec(spec); sys.modules[spec.name]=module; spec.loader.exec_module(module)

class HopperCompilerTests(unittest.TestCase):
    def test_writing_voice_excluded_by_default(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)/"corpus"
            for name,body in (("Genre_Hopper","acid techno instrumental groove"),("Writing_Voice","private prose sample fragment long enough")):
                (root/name).mkdir(parents=True)
                (root/name/"sample.txt").write_text(body,encoding="utf-8")
            self.assertEqual(set(module.load_hoppers(root)),{"Genre_Hopper"})
    def test_allowlist(self):
        with tempfile.TemporaryDirectory() as td:
            root=Path(td)/"corpus"
            for name in ("Genre_Hopper","Lyrics_Hopper"):
                (root/name).mkdir(parents=True); (root/name/"x.txt").write_text(name+" experimental prompt fragment")
            self.assertEqual(set(module.load_hoppers(root,{"Lyrics_Hopper"})),{"Lyrics_Hopper"})
    def test_seed_reproduces_outputs(self):
        h={"Genre_Hopper":[module.Fragment("acid","Genre_Hopper","a"),module.Fragment("drone","Genre_Hopper","b")]}
        self.assertEqual(module.compile_both(h,100,100,random.Random(42)),module.compile_both(h,100,100,random.Random(42)))
if __name__=="__main__": unittest.main()
