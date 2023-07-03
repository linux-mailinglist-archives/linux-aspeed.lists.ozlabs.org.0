Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E7745548
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jul 2023 08:04:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=sEx03 header.b=pQcJPw1v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qvb3z6GdYz3dKj
	for <lists+linux-aspeed@lfdr.de>; Mon,  3 Jul 2023 16:04:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inventec.com header.i=@inventec.com header.a=rsa-sha256 header.s=sEx03 header.b=pQcJPw1v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inventec.com (client-ip=218.32.67.185; helo=mail.inventec.com; envelope-from=chen.pj@inventec.com; receiver=lists.ozlabs.org)
Received: from mail.inventec.com (mail.inventec.com [218.32.67.185])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qvb1P1rc3z3d9W
	for <linux-aspeed@lists.ozlabs.org>; Mon,  3 Jul 2023 16:02:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
    s=sEx03; d=inventec.com;
    h=from:to:cc:subject:date:message-id:mime-version:content-type;
    bh=dcvSYvSNU+uro1iISYrrd705f26G2TyH8iwSt1QWGqw=;
    b=pQcJPw1vKC/BVgGR4Lkr+ZRGD8aZQ53szY8rM9aAsb1FJayAYlhFDJwhRK+9mJ
      m5AkjFdk+mEQx3jypH+GfZ44/gN8kEYM8MCKFsxEHN5dj+QtHgUlnaKnSkxeeL
      FvAkoUN76ndnjNa7srNkozM4SeiHdoqPwAZIzCfZerQkZK4=
Received: from IEC1-EX2016-04.iec.inventec (10.1.254.222) by
 IEC1-EX2016-03.iec.inventec (10.15.2.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 3 Jul 2023 14:02:24 +0800
Received: from TAO-MailRelay-1.iec.inventec (10.6.254.133) by
 IEC1-EX2016-04.iec.inventec (10.1.254.222) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Mon, 3 Jul 2023 14:02:24 +0800
Received: from charon ([10.6.141.37]) by TAO-MailRelay-1.iec.inventec with Microsoft SMTPSVC(8.0.9200.16384);
	 Mon, 3 Jul 2023 14:02:23 +0800
From: PJ Chen <chen.pj@inventec.com>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
Date: Mon, 3 Jul 2023 14:02:21 +0800
Message-ID: <20230703060222.24263-1-chen.pj@inventec.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 Jul 2023 06:02:24.0048 (UTC) FILETIME=[EFD1AB00:01D9AD73]
Content-Type: text/plain
X-TM-SNTS-SMTP: 3E1DF7C11C547A2FC99E3D2474257FEF65628B9BCDE1CD7826B620155397CAE42000:8
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
Cc: ye.vic@inventec.com, Chen PJ <Chen.pj@inventec.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Huang.Alang@inventec.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

From: Chen PJ <Chen.pj@inventec.com>

Document the new compatibles used on Inventec starscream-bmc

Signed-off-by: Chen PJ <Chen.pj@inventec.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 1b585e554791..fb4ce5df2fa0 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -82,6 +82,7 @@ properties:
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
+              - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
               - nuvia,dc-scm-bmc
-- 
2.25.1

