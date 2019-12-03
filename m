Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F349C10FD38
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:07:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S11g6tvqzDqVk
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:07:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mvRcSmjJ"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="BKeODkHb"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S0wp6fDTzDqVl
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:02:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id DD154D04;
 Tue,  3 Dec 2019 07:02:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:02:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=ztq7FLHlrns5zu/XcOJ2JlDLPY
 qZhl4Q876ZoCQ+iMU=; b=mvRcSmjJQh0CRMvAcEkW9kerL29X7umeGBKg/+gbPu
 2LoTDXE79vt69JFJbwznqTXvEc7fsEWMmtQAS4KV1ME094Z+gQoBy4oBJ76Qdd7l
 RpzIrgWbLI8ogu6UqBDkAoOqt55DkxOvI2blo8WIWT20GfEsWJ9UopeMd6WaOhG2
 bpbRoiDd2Fay8bbe7wEztgU6z5JIYOC6KRg+7IkfXxN4mfW/ku0LjgtrwfI/KqfK
 Xz4w2IDJa+PPVv4DUFycF7+2HXRR90+/HvRf0xPR1PasF9ypO6ZV8Sf4skCCGwqq
 J2kjnNTyYwjAuO0MMtUKSbtQ9oB0n7aRuN+2+uR1pkDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ztq7FLHlrns5zu/Xc
 OJ2JlDLPYqZhl4Q876ZoCQ+iMU=; b=BKeODkHb4W0FDe04Sxq6J57Op9FbaHVGp
 3FAQX6K5SH+qqo7dNp/xenvGryg8yB7isLaaPXJczEET9KJejDdGyy8qBWCCZNQU
 0jXEBswKRW2Ta41C6Y48NiwyTuULRbfTkOJf0Su/F4/vM1e0eNd8iK+y2GtAhtag
 Jj+grfGA1KJBvUVtXmFEi0PoR+TnA9u8uq9gsaO7w4PI6098oLwpnzkYhPyW00jk
 4WBEP3U55pEbo+6UbQy84nlY+7MleTuSgsK4tTJjGY2PdYTmYsuLGmyOhWc+uxLN
 /Uh2JioCG1Dv5puImHWf+sgNRsezI1ayvQMoaPWyYaeLdnBgkXmdw==
X-ME-Sender: <xms:407mXWaFPcTpZik5e3BkQWVrt8snnAJJrRNX-g_hggdEG8OZV3dxeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedgfeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
 dttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegrjhdr
 ihgurdgruheqnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddukedrvd
 duuddrledvrddufeenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:407mXaXuS35u7D7UWegYnTOzGj9sNKYYUmSsryisssIRuo7Ufnrs1g>
 <xmx:407mXRTghfOJ0UqP0hKAv_PzLbm2Dz4kcgpn6weMCcdgfoW9TTdqeA>
 <xmx:407mXXEqRI_xwvbFpt3JiRbJqP_dtAab5HKNdXWH_zcWMwy4CQfMkw>
 <xmx:5U7mXe_N_BAFOfuorW227HAYtguJjMdZltqXMAzzltXw98SN-bgYbw>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF15730600AA;
 Tue,  3 Dec 2019 07:02:36 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 00/14] ARM: dts: aspeed: Cleanup dtc warnings
Date: Tue,  3 Dec 2019 22:34:01 +1030
Message-Id: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, xow@google.com,
 chen.kenyy@inventec.com, gregkh@linuxfoundation.org, linus.walleij@linaro.org,
 anoo@us.ibm.com, linux-kernel@vger.kernel.org, yao.yuan@linaro.org,
 a.filippov@yadro.com, robh+dt@kernel.org, yang.brianc.w@inventec.com,
 venture@google.com, sschaeck@cisco.com, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This series is based on an RFC-ish series I sent quite some time ago to which I
have only just been able to circle back. The previous discussion can be found
here:

https://lore.kernel.org/lkml/20190726053959.2003-1-andrew@aj.id.au/

I've split, shuffled and rebased the series a little, with at least one extra
cleanup for the g6 dtsi. This series is just the devicetree changes, the IPMI
KCS changes will be posted separately shortly.

Combined with the KCS changes we achieve similar stats to the RFC series,
reducing 264 warnings to 6.

I've added each patches' tags from last time, but please glance over them
again.

Cheers,

Andrew

Andrew Jeffery (14):
  dt-bindings: pinctrl: aspeed: Add reg property as a hint
  dt-bindings: misc: Document reg for aspeed,p2a-ctrl nodes
  ARM: dts: aspeed-g5: Move EDAC node to APB
  ARM: dts: aspeed-g5: Use recommended generic node name for SDMC
  ARM: dts: aspeed-g5: Fix aspeed,external-nodes description
  ARM: dts: vesnin: Add unit address for memory node
  ARM: dts: fp5280g2: Cleanup gpio-keys-polled properties
  ARM: dts: swift: Cleanup gpio-keys-polled properties
  ARM: dts: witherspoon: Cleanup gpio-keys-polled properties
  ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
  ARM: dts: aspeed: Add reg hints to syscon children
  ARM: dts: aspeed-g5: Sort LPC child nodes by unit address
  ARM: dts: aspeed-g6: Cleanup watchdog unit address
  ARM: dts: ibm-power9-dual: Add a unit address for OCC nodes

 Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt            |  1 +
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml |  3 +++
 Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml |  3 +++
 arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts                  |  4 ----
 arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts              |  4 ----
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts                      | 11 +++++++----
 arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts                        |  4 ----
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts                          |  4 ----
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts                          |  4 ----
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts                            |  6 ------
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts                           |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts                      |  6 ------
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts                            |  2 --
 arch/arm/boot/dts/aspeed-g4.dtsi                                      | 21 ++++++++++++---------
 arch/arm/boot/dts/aspeed-g5.dtsi                                      | 49 ++++++++++++++++++++++++++-----------------------
 arch/arm/boot/dts/aspeed-g6.dtsi                                      |  2 +-
 arch/arm/boot/dts/ibm-power9-dual.dtsi                                |  4 ++--
 17 files changed, 56 insertions(+), 74 deletions(-)

base-commit: 3eca037f2dfce07a31da0a837ac35d6d846614b0
-- 
git-series 0.9.1
