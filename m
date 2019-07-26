Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13175E89
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:42:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vydn3dQyzDqF0
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:42:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="jo8iGeq1"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="p8Oorf8g"; dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vyc74Y78zDqDr
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:55 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 013904354;
 Fri, 26 Jul 2019 01:40:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=N21lR+UePFSTS
 Oonw/4Zqd1zUZuquw1QFMaclxAMTOA=; b=jo8iGeq1m8yt8zAmXX/flAhKvSEtg
 WYJ1i6T7YcE5DCu9bvy4//qdzKcdYYhNohYCcriWGhFAXD3bQUEM2KT5Wew2IC27
 gulXrf41UM9uiYY2H5t+ikWmu4m3XfVwBS7M6bCchg+uFf2tVbs55dOCNO3st/wJ
 Z/fXGLKBxkB7uvcjg7UQV5xM3s2nqAjRgEFoa1MKiC4QA9Nf+oPCl7hWkTAhHJQK
 t12HMX88EyrXOhUp7NAFKN2E3xdkYAgX1FhjKBHrdSgWUV5KTR/Lh2OA4oZ42EjJ
 aKHpczQ7k9wxMKWAEnK4/AIOcmkVC6rLrFaoyinNUDvNsMqZJ+WF+60ZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=N21lR+UePFSTSOonw/4Zqd1zUZuquw1QFMaclxAMTOA=; b=p8Oorf8g
 IUOpF4VAnSxAfJw+VJX2INYAsSTTwFkwxD10LfL7VKhs+4m0DyHjtAJJ0OVXAHiU
 u3IO5bJ9A/uZxMtX0UPuGZl0sO5We1CQT60AN8ceWUc18ICxbUslYbskjH+64uS7
 3bwUz+/mXQ9XL4VD1htxZLIcj3zXgubiLd/krQ2gke+YaRd+Z05QFTryr3qKSHig
 jAxi2mEbWWCoECey/nD37TdfmPKRnxr/R/IIc1lpM24StPOyOkuc0riAY7djA25W
 uA2NSP5Qg+oJ1GegOMCLxensRd3ukx6uPgQw0iTZEfHYDSlcH5XBMBrgJs4A7tXV
 quP7GOrh3ocrvw==
X-ME-Sender: <xms:YpI6XZBXHBUjkTamzgVJaJX3ZZIF043dEm-8dSubgkdA6W7ZyNmvIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdellecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:YpI6XVauUYUaL6w-Ojy8DaeMEEg31_SL-iuxMs0zg_y8dm91cbzpOw>
 <xmx:YpI6XdryhR13X_J2SV_VZwHrmVvXr84Y0NIXLDZBVTaLjAP1c5h9yw>
 <xmx:YpI6XVCgQnK2xnZv0GuV63LRFCER4n75Y_rZVJCTiPza2RuyYipQLQ>
 <xmx:YpI6XZkqLpkruswpMA1AwEToQAPhlxpqqrPsJGLOg-jkJeGTjfmePw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 76394380076;
 Fri, 26 Jul 2019 01:40:46 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [RFC PATCH 13/17] dt-bindings: ipmi: aspeed: Introduce a v2 binding
 for KCS
Date: Fri, 26 Jul 2019 15:09:55 +0930
Message-Id: <20190726053959.2003-14-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
References: <20190726053959.2003-1-andrew@aj.id.au>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Haiyue Wang <haiyue.wang@linux.intel.com>, Corey Minyard <minyard@acm.org>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 openipmi-developer@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The v2 binding utilises reg and renames some of the v1 properties.

Cc: Haiyue Wang <haiyue.wang@linux.intel.com>
Cc: Corey Minyard <minyard@acm.org>
Cc: openipmi-developer@lists.sourceforge.net
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 .../bindings/ipmi/aspeed-kcs-bmc.txt          | 20 +++++++++++++------
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
2.20.1

