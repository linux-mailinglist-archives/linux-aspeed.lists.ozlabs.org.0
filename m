Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B86575E7E
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:41:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vycW17Y5zDqD1
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:41:15 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="mMz39AGz"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="O9A9eeM3"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybW0CjjzDqPS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AE12922304;
 Fri, 26 Jul 2019 01:40:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=FGnrb1We2FOVt
 /++AKR6ddEpH2XDEzYVw5O9qXjrW4c=; b=mMz39AGz6K22TPx02gYs+cd59F73Q
 ymNswcu7ZcjW8sC5jQb2+sBNJk2lLnZj/KM/E4Yw6MfYOLeAVSv9/N9Cyxc5dInI
 ILm4BfzIYhLTVMnb/VA3G8ulzuC7zrALU0t4TLAt2+vTLqgBZb/N6PxeGXj3M1ta
 m4B1Lph2fv1fVOtWIQDKRJfqZYeFAU4ZBpQkMrTduGMhE3XRVrprjs0caXI4AzqQ
 nI4CfrUwMJQfFMZry/9Yt7r6aRanLysbRzbtT4R4av26ZcDe082uluVrH6jY/zHB
 V3zZku9zXXgoUt94WQg6bKflBpEUzCoKIowj8drii6hG6xOjCHPEtDMKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=FGnrb1We2FOVt/++AKR6ddEpH2XDEzYVw5O9qXjrW4c=; b=O9A9eeM3
 4BtcB66bgmHNI18lEjrkyqKy9eO+g/Ecx+meEOju5Jn26CgYggOtFLmeU5NxL/Fs
 JvFNeIkhhOX5OM4Eg5JjDoXhHsRhGmlHgzoSIlHUVyoua9bEdI+cFr0VZcIGSKxS
 GmH2C8nBpdojs0JHnZ8Tcfzh5wf7oH1342ovzcGhAqD1pqHLQKQfgw8+3LW9UTl2
 xby2nJ1WEXBwznBBbjHUsjH/SJ7p2TdWnFkExKo+ZCJvlKTnrsviAt42+qS1wN1T
 SCnhLfkiqoeoR8otGEw7Otb0LYLdaztVe1O55OXyzZIcVd3ayVQqO0Cw+MKYpJwg
 UUMiXN7/bdnd9g==
X-ME-Sender: <xms:RJI6XaQrHM3bllWNNzUdCXWaPW2UuhkmQKG9ygJpgMYg8U5npw4unQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpeef
X-ME-Proxy: <xmx:RJI6XdLEgXOUllC0AhkhBvsi8jHtnpu1jcBQrlD8G7zLr4ucZIEaHg>
 <xmx:RJI6XfLwrysAEgLKcPaFS5aa4FmlIxEQguEWkANwXclTjpeX355g0A>
 <xmx:RJI6XQhsOzujfQ4yGGF-QAISLMsI7bt7MZVpWQ7-rCJgfR8ax30U2A>
 <xmx:RJI6Xd4D749w7J3o9KEiMOEU-GWvHneHbHE3qyiE8eHfXvi5OCMicw>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 84613380079;
 Fri, 26 Jul 2019 01:40:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 05/17] ARM: dts: fp5280g2: Cleanup gpio-keys-polled properties
Date: Fri, 26 Jul 2019 15:09:47 +0930
Message-Id: <20190726053959.2003-6-andrew@aj.id.au>
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
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

dtbs_check gave the following warning:

    Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Cc: John Wang <wangzqbj@inspur.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 2dd664bff928..aa5efd1dfa70 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -94,8 +94,6 @@
 
 	gpio-keys-polled {
 		compatible = "gpio-keys-polled";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		poll-interval = <1000>;
 
 		fan0-presence {
-- 
2.20.1

