Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 30C418D4320
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 03:46:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WvwVfVTi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqTTg73Snz798l
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2024 11:40:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=WvwVfVTi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqTTZ6Yyvz796s
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2024 11:40:18 +1000 (AEST)
Received: from [127.0.1.1] (ppp118-210-171-248.adl-adc-lon-bras34.tpg.internode.on.net [118.210.171.248])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E47652012A;
	Thu, 30 May 2024 09:40:17 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1717033218;
	bh=EnpgvCQ83VB8g74TESGnxZOig6hO4zozd7+EDbYaZdE=;
	h=From:Subject:Date:To:Cc;
	b=WvwVfVTijD1agLB40N6LiGES8bNqb6Zrj+GTlB3LCCXAxk8zVRoSt+qSfCWcI8iwE
	 Nm9Y1MB3tjp54zgB2PSZf9/xyoOGZS40+xrOxtHSygWk8OD8iEZ1MPMRwQQTrSvZq2
	 1kfaLVzkaZBndUiedAxv7FZt/pJVRA0zk9O9B7rbc5Y5Etnk0CwRURgXymHtLFtPrZ
	 bs8Ea+/z8Sej7Qnn54llR6+7PXmvQuCm9rz6qNP2OPuLnODAzCDQW00KR5ug4Re9Os
	 T++Wd9abvPhay84WSAl28ecfJIsG0DIB6iaNE0QNNoObNQ23MZxHPpuR4VoMFswW9L
	 J5SKo1HEu0SXA==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH v2 0/2] dt-bindings: gpio: aspeed,sgpio: Miscellaneous
 cleanups
Date: Thu, 30 May 2024 11:09:47 +0930
Message-Id: <20240530-dt-warnings-gpio-sgpio-interrupt-cells-v2-0-912cd16e641f@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPYV2YC/43NTQ6CMBCG4auYrh1Syo/gynsYFtAOMAm2pFNQQ
 7i7lcS9m0neWXzPJhg9IYvraRMeV2JyNoY6n4QeWzsgkIktlFS5LFQFJsCz9ZbswDDM5ICPSza
 g98scQOM0MZRV0UrsjdKyE3Fs9tjT64DuTeyRODj/Ptw1/X5/RP0vsaYgoU51rupLWWVZd9POo
 HaWg190SLR7JO0imn3fP6FgIb3nAAAA
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

This short series fixes some SGPIO-related devicetree warnings currently
emitted by `make dtbs_check` for Aspeed devicetrees.

Please review!

Andrew

---
Changes in v2:
- Dropped 1/4 from v1 as it was considered noise (Krzysztof)
- Squashed 4/4 into 3/4 from v1 (Krzysztof)
- Addressed remaining comments and applied tags (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240529-dt-warnings-gpio-sgpio-interrupt-cells-v1-0-91c42976833b@codeconstruct.com.au

---
Andrew Jeffery (2):
      dt-bindings: gpio: aspeed,sgpio: Specify gpio-line-names
      dt-bindings: gpio: aspeed,sgpio: Specify #interrupt-cells

 Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240528-dt-warnings-gpio-sgpio-interrupt-cells-685a0efd2c0b

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

