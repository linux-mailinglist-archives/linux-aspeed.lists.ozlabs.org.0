Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB1310FDE6
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 13:42:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S1pS7277zDqWb
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 23:42:24 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="fC0cu19w"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="f8zM9Bg2"; dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S1h22CsPzDqTv
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 23:36:49 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C07C76E64;
 Tue,  3 Dec 2019 07:36:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Dec 2019 07:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=8ZlgpTfN5GmTh
 4i624Rlcksvxj54ouDMeKXMopZs1XE=; b=fC0cu19wEM2nuuI5OlavXIp8itYWV
 MAH8uNjjus+ai8C9rm581qD0MGE1MQPfCpHT7k+Xx35iLwXZ2dPFcyj2R5QFVFVK
 r/J3HC1BEhFFf0RuQWMBX8XwNJO3uUhTs/RwIW1QjzrymgrvaUTbgXKLzqTJh2/1
 4FYbS+JLNj84ju6+5VJm/uAXF79suZDe0HAqQBct3qPeQ2T/9C5E0WH8Qea0/doi
 Su8LonezleqcHA7Y6DBaYeucKmUn/6YlAjgtN64z6KdQvRQpwf0gNBDPCMdTPyvj
 qKe7Z9bMdVUNknbT5aZPKfHUI9c5U2xMz8JZfbM4geoZAXOJ+IW1QFymQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=8ZlgpTfN5GmTh4i624Rlcksvxj54ouDMeKXMopZs1XE=; b=f8zM9Bg2
 5+XdexcX1HdP+Nc0MizFl6zEBAtqnyFjbCDVmk1mFsAHDEvAJgr1gQO2xuSfHJkn
 SivHEtnq1C3wfUzFk/e5r94KjpbN89eUNJhJui596uKZ4zR6e6DzLPRF+6ZoknZr
 aBD7x5basN5cFNZZx7WBM5TpfTDpNE3jrQFmXvGRrb5z7JJR6XJO/vLTwxxF+wKD
 UtaIvBpEnWvVsCK/Mdoona/hpli6E8EkIhMyXnHRpT1ghOlGw9mRCzJyMzHacDs+
 ndM7/f3Gnojt6yep89I7bdsY8EYbtWkDIXCwv5/W54AEU6PAeORXoqvrZ3IfBFPG
 SPx3C9uA3BqhFg==
X-ME-Sender: <xms:3lbmXXS06qAsIh1BD-aS17ZHpW-GEbJiEHKRu2oXaFu-aW0z7zRjfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudejjedggeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecukfhppeduudekrddvuddurdelvddrudefnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:3lbmXXCTd7ecyAxMLtfyGT24QKHC1-5VqEBO9Mr-W6TJktoEgv5lIw>
 <xmx:3lbmXWKq7o7n15b5OIJLdTrvWZEtXvERoKNQrQAM0mPq52D1awf3HQ>
 <xmx:3lbmXaBq701cVdq9NzQP08T5sOdl2RqeYoADJt6NbxwzN1vp-neKxw>
 <xmx:3lbmXYx9LTKAIt-N3KHwH-c1NkSLOm35M-eWZyFJ3EVsEmSM2KYvSA>
Received: from mistburn.lan (unknown [118.211.92.13])
 by mail.messagingengine.com (Postfix) with ESMTPA id ABCD5306017A;
 Tue,  3 Dec 2019 07:36:42 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openipmi-developer@lists.sourceforge.net
Subject: [PATCH 1/3] dt-bindings: ipmi: aspeed: Introduce a v2 binding for KCS
Date: Tue,  3 Dec 2019 23:08:23 +1030
Message-Id: <3da2492c244962c27b21aad87bfa6bf74f568f1d.1575376664.git-series.andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
References: <cover.5630f63168ad5cddf02e9796106f8e086c196907.1575376664.git-series.andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, minyard@acm.org,
 arnd@arndb.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The v2 binding utilises reg and renames some of the v1 properties.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt | 20 +++++---
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
index d98a9bf45d6c..76b180ebbde4 100644
--- a/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
+++ b/Documentation/devicetree/bindings/ipmi/aspeed-kcs-bmc.txt
@@ -1,9 +1,10 @@
-* Aspeed KCS (Keyboard Controller Style) IPMI interface
+# Aspeed KCS (Keyboard Controller Style) IPMI interface
 
 The Aspeed SOCs (AST2400 and AST2500) are commonly used as BMCs
 (Baseboard Management Controllers) and the KCS interface can be
 used to perform in-band IPMI communication with their host.
 
+## v1
 Required properties:
 - compatible : should be one of
     "aspeed,ast2400-kcs-bmc"
@@ -12,14 +13,21 @@ Required properties:
 - kcs_chan : The LPC channel number in the controller
 - kcs_addr : The host CPU IO map address
 
+## v2
+Required properties:
+- compatible : should be one of
+    "aspeed,ast2400-kcs-bmc-v2"
+    "aspeed,ast2500-kcs-bmc-v2"
+- reg : The address and size of the IDR, ODR and STR registers
+- interrupts : interrupt generated by the controller
+- slave-reg : The host CPU IO map address
 
 Example:
 
-    kcs3: kcs3@0 {
-        compatible = "aspeed,ast2500-kcs-bmc";
-        reg = <0x0 0x80>;
+    kcs3: kcs@24 {
+        compatible = "aspeed,ast2500-kcs-bmc-v2";
+        reg = <0x24 0x1>, <0x30 0x1>, <0x3c 0x1>;
         interrupts = <8>;
-        kcs_chan = <3>;
-        kcs_addr = <0xCA2>;
+        slave-reg = <0xca2>;
         status = "okay";
     };
-- 
git-series 0.9.1
