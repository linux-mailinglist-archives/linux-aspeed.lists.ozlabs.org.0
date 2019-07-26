Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E075E61
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 07:40:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vybd0swjzDqPm
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2019 15:40:29 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="j1juVrhh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="13UwN+I1"; dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vybH2XJ1zDqPT
 for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2019 15:40:11 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B08EE22131;
 Fri, 26 Jul 2019 01:40:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 26 Jul 2019 01:40:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=4kLlrK+bLpUiR
 kTdTMxXoERa1h6aqhA++4P0gBqwURU=; b=j1juVrhhLMckXwlc7/pOFPMZKMA+I
 RioLQDqClV+EzcwgalYLqn3YgxAz+Wf6IRdPvGcOu6/clD3MmJbQoGs/TRXcpsHR
 Jl7HaGkoukusvw4/h6w1SpBVE9V2crg5eVfFui+C+C4CplAU0b7EvbPBPjoJ+cHR
 EjPCQuF2GG7W1593RMXIFN9SzmI9oo37/VLGE8MzYvBTUUHqpVMpb2Thwh1h0Xy5
 mDdx/NihtldJBsVoBOTW5GeQV4rcsmwfQo5I5BJLKtCZ1DqqUFYSjQpbPv8683Ww
 I1YisdHVQTKzcFHQjqfjY4DtUBiucsr+NDMauiP17wHa99rqAtxskWvlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=4kLlrK+bLpUiRkTdTMxXoERa1h6aqhA++4P0gBqwURU=; b=13UwN+I1
 KmI1jM6XaX7KqMcfdklGfiOj4v+3/x0gak05kCI0WAwzFqngjuklcpYRpZoypVrv
 +4FCH9zedZd4jZTrr1cN96W4iWiIoo5VlEaUNRHpocOTmmqA1eiK8y3dxGuhzXSy
 iv4pulMva8nud3NVVL7A/Ep8a+O/gpsymiPuKw5tAkG1LfvD3J/Er0E3CAVcum+j
 xNeE++gs2FaZor+8afpKo+uieD3InFox45iBu5QYX/dFfkbeXUB0yh39/sRC4YEo
 wQC+Zxw1h78qTYGqghtXdRdH1p+L3wreiyW/GKq0xPG4clNkS9PT5UrQUGihStGm
 JFXKTRBtOeuWyQ==
X-ME-Sender: <xms:OJI6XdiRTr2aRt-BDK6qw-7fyBldu8ovlfnUSVmmSkSn3XINxW62Zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppedvtddvrd
 ekuddrudekrdeftdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdr
 ihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:OJI6Xe_mKIh3JWASLHnuqueI1EB7lh5F-7duD1XI9g9vQEykLQRsHA>
 <xmx:OJI6XYsrIlSYWWVIwYsezpdWoSqeuo7EgxjCKf4jATR6Dep6zEuzQw>
 <xmx:OJI6Xar6DVyzt4w9Xj_SsYqeBM7Gg4IYHJnfKy75z1ZJzTR_MgLxwA>
 <xmx:OJI6XRWrAh_RDQYTk5AzX7F7e9Jiflcyj07o8ygtqzlmMMgytLbk4A>
Received: from mistburn.au.ibm.com (bh02i525f01.au.ibm.com [202.81.18.30])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8F1F5380079;
 Fri, 26 Jul 2019 01:40:05 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 02/17] ARM: dts: aspeed-g5: Use recommended generic node name
 for SDMC
Date: Fri, 26 Jul 2019 15:09:44 +0930
Message-Id: <20190726053959.2003-3-andrew@aj.id.au>
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
 Stefan M Schaeckeler <sschaeck@cisco.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The EDAC is a sub-function of the SDRAM Memory Controller. Rename the
node to the appropriate generic node name.

Cc: Stefan M Schaeckeler <sschaeck@cisco.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 7723afc7c249..6e5b0c493f16 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -199,7 +199,7 @@
 			#size-cells = <1>;
 			ranges;
 
-			edac: sdram@1e6e0000 {
+			edac: memory-controller@1e6e0000 {
 				compatible = "aspeed,ast2500-sdram-edac";
 				reg = <0x1e6e0000 0x174>;
 				interrupts = <0>;
-- 
2.20.1

