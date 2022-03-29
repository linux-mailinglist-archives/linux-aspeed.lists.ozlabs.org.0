Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D64EB2DC
	for <lists+linux-aspeed@lfdr.de>; Tue, 29 Mar 2022 19:41:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KScLM5w1vz2xr9
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 04:41:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=b36msbYN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=129.46.98.28; helo=alexa-out.qualcomm.com;
 envelope-from=quic_jaehyoo@quicinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=b36msbYN; dkim-atps=neutral
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KScLH6ZVCz2xvv
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 04:41:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1648575672; x=1680111672;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D+tX1MdwDp+DGiNC0mMfAkYh1QVOh0bet1Fnruk5CV8=;
 b=b36msbYNxkXaJqeCp/aIzkZUREztbM5fm8shXlNp9uD8VnPw1T82nzJ4
 QrdalQBg68EkFUWCjztp36icrYrC4hIdzo6q7rwbAVyIvUti5JqL1OcS8
 vgOV9hLoW5Rxb2NdECMIQmbEZlS4jThGW6Owi6OmAntrDASX3mf5jI/8s 0=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 29 Mar 2022 10:40:10 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 10:40:10 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 29 Mar 2022 10:40:09 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 29 Mar
 2022 10:40:08 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Andrew Jeffery <andrew@aj.id.au>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Arnd Bergmann
 <arnd@arndb.de>
Subject: [PATCH v3 3/7] dt-bindings: pinctrl: aspeed-g6: remove FWQSPID group
Date: Tue, 29 Mar 2022 10:39:28 -0700
Message-ID: <20220329173932.2588289-4-quic_jaehyoo@quicinc.com>
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

FWQSPID is not a group of FWSPID so remove it.

Fixes: 7488838f2315 ("dt-bindings: pinctrl: aspeed: Document AST2600 pinmux")
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
---
Changes in v3:
 * Newly added in v3. (Andrew)

 .../devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
index 57b68d6c7c70..eb6e2f2dc9eb 100644
--- a/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml
@@ -58,7 +58,7 @@ patternProperties:
           $ref: "/schemas/types.yaml#/definitions/string"
           enum: [ ADC0, ADC1, ADC10, ADC11, ADC12, ADC13, ADC14, ADC15, ADC2,
                   ADC3, ADC4, ADC5, ADC6, ADC7, ADC8, ADC9, BMCINT, EMMCG1, EMMCG4,
-                  EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID, FWQSPID, FWSPIWP,
+                  EMMCG8, ESPI, ESPIALT, FSI1, FSI2, FWSPIABR, FWSPID, FWSPIWP,
                   GPIT0, GPIT1, GPIT2, GPIT3, GPIT4, GPIT5, GPIT6, GPIT7, GPIU0, GPIU1,
                   GPIU2, GPIU3, GPIU4, GPIU5, GPIU6, GPIU7, HVI3C3, HVI3C4, I2C1, I2C10,
                   I2C11, I2C12, I2C13, I2C14, I2C15, I2C16, I2C2, I2C3, I2C4, I2C5,
-- 
2.25.1

