class Bunpy < Formula
  desc "One binary for Python: runtime, packages, bundler, tests"
  homepage "https://github.com/tamnd/bunpy"
  version "0.12.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-arm64.tar.gz"
      sha256 "9a8af71d548d5ec0287c766051e83817493895fc250fe3696f170563ca737750"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-darwin-amd64.tar.gz"
      sha256 "60a6809043294913f8caf68937d2a23998995083fe63241a05e114c8027a41ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-arm64.tar.gz"
      sha256 "b9b8e88fb25ad054978310be45b2e344a86f43bbb0586cd55d9bf5a744bd2c0c"
    end
    on_intel do
      url "https://github.com/tamnd/bunpy/releases/download/v#{version}/bunpy-v#{version}-linux-amd64.tar.gz"
      sha256 "479439e8701b1a1304546d9340698daa5c35ad1514eb11f60e97902b823072c5"
    end
  end

  def install
    arch = Hardware::CPU.arm? ? "arm64" : "amd64"
    os = OS.mac? ? "darwin" : "linux"
    stage = "bunpy-v#{version}-#{os}-#{arch}"
    bin.install "#{stage}/bunpy"
    if Dir.exist?("#{stage}/share/man/man1")
      man1.install Dir["#{stage}/share/man/man1/*.1"]
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bunpy version --short").strip
  end
end
