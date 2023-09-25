Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4137ACE97
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 05:07:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f8WhEEgj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rv78F2qkNz3cn7
	for <lists+linux-aspeed@lfdr.de>; Mon, 25 Sep 2023 13:07:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=f8WhEEgj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rv7852thSz3c8Y;
	Mon, 25 Sep 2023 13:07:01 +1000 (AEST)
Received: from localhost.localdomain (ppp118-210-175-231.adl-adc-lon-bras34.tpg.internode.on.net [118.210.175.231])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 71CB420172;
	Mon, 25 Sep 2023 11:06:58 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1695611219;
	bh=hSW2jDWPujgtEV8cEoru33vgnmkR7CY+fa5+NBEC1Nk=;
	h=From:To:Cc:Subject:Date;
	b=f8WhEEgjV/kX+2QkmOwA8DmSGzO0Yw/NczkDPL3N4ZbRC7fWrJkh1JMQeL33TqAab
	 pvm+q0+TA+kOhf6y5ZPAqGPPV6j+nFYGjah3sLs8fH0fRpYQNFaxs0w/1h4IV0JI5y
	 YxBkYAJ3QisHi4G+x0g7yMqeSRzPZB3bN0FfaJLBQZ+4ATQOJb760AL6ZpnI047EdK
	 e6gd3AoJgHcF+NLya3sM/dj5vsamoUm4ixMfw78jD9DOJPqEJ+lRk9eJeQU3X2oBmS
	 eKVaSjKBEtaGvf3aXXOhYm0NcJzhubp9pZram9hl3odv3ln6j+ExF0HZla4QfHrcGw
	 gOGSUfkvdww6Q==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: joel@jms.id.au,
	andrew@aj.id.au
Subject: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
Date: Mon, 25 Sep 2023 12:36:47 +0930
Message-Id: <20230925030647.40283-1-andrew@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Andrew Jeffery <andrew@codeconstruct.com.au>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I've changed employers, have company email that deals with patch-based
workflows without too much of a headache, and am trying to steer some
content out of my personal mail.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b19995690904..1965cee433b0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1963,7 +1963,7 @@ F:	drivers/irqchip/irq-aspeed-i2c-ic.c
 
 ARM/ASPEED MACHINE SUPPORT
 M:	Joel Stanley <joel@jms.id.au>
-R:	Andrew Jeffery <andrew@aj.id.au>
+R:	Andrew Jeffery <andrew@codeconstruct.com.au>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
@@ -3058,7 +3058,7 @@ F:	Documentation/devicetree/bindings/peci/peci-aspeed.yaml
 F:	drivers/peci/controller/peci-aspeed.c
 
 ASPEED PINCTRL DRIVERS
-M:	Andrew Jeffery <andrew@aj.id.au>
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 L:	linux-gpio@vger.kernel.org
@@ -3075,7 +3075,7 @@ F:	drivers/irqchip/irq-aspeed-scu-ic.c
 F:	include/dt-bindings/interrupt-controller/aspeed-scu-ic.h
 
 ASPEED SD/MMC DRIVER
-M:	Andrew Jeffery <andrew@aj.id.au>
+M:	Andrew Jeffery <andrew@codeconstruct.com.au>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 L:	openbmc@lists.ozlabs.org (moderated for non-subscribers)
 L:	linux-mmc@vger.kernel.org
-- 
2.39.2

