Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118A4EB2CF
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 19:40:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KScKG1Nj2z2yR4
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:40:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=sr7IwiYG;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_jaehyoo@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=sr7IwiYG; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KScK76pWmz2x9v
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 04:40:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648575612; x=1680111612;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PQUFDzBMaFAzQRcBm4vkC8oA52XRe+Y4BErXK9V1SFs=;
 b=sr7IwiYGo2hyLl2K8Ih7WO9lYoqdvNC2LTeOZD2BQFmXf045o/c0p2aT
 AQ4Tkn13IMjBqI77cTjtDDTHEzjUtLqujdXWoEEAvLHf7ngP/wHO9vHDD
 HR6HXvJz9va9p5G27x8Zd7fZPTidjICV7gbRIBwciXMZmG/k17YGELM34 I=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 29 Mar 2022 10:40:08 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 10:40:07 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 10:40:07 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 10:40:06 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann
 <arnd@arndb.de>
Subject: [PATCH v3 1/7] ARM: dts: aspeed-g6: remove FWQSPID group in pinctrl
 dtsi
Date: Tue, 29 Mar 2022 10:39:26 -0700
Message-ID: <20220329173932.2588289-2-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
References: <20220329173932.2588289-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Jamie Iles <quic_jiles@quicinc.com>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

FWSPIDQ2 and FWSPIDQ3 are not part of FWSPI18 interface so remove
FWQSPID group in pinctrl dtsi. These pins must be used with the
FWSPI pins that are dedicated for boot SPI interface which provides
same 3.3v logic level.

Fixes: 2f6edb6bcb2f ("ARM: dts: aspeed: Fix AST2600 quad spi group")
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
---
Changes in v3:
 * None.

Changes in v2:
 * Rebased it on the latest.
 * Updated 'Fixes' while rebasing it on the latest.

Note:
 * Removing 'pinctrl_fwqspid_default' doesn't break any existing DT since
   it has not been used in any DTs.

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index e4775bbceecc..06d60a8540e9 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -117,11 +117,6 @@ pinctrl_fwspid_default: fwspid_default {
 		groups = "FWSPID";
 	};
 
-	pinctrl_fwqspid_default: fwqspid_default {
-		function = "FWSPID";
-		groups = "FWQSPID";
-	};
-
 	pinctrl_fwspiwp_default: fwspiwp_default {
 		function = "FWSPIWP";
 		groups = "FWSPIWP";
-- 
2.25.1

