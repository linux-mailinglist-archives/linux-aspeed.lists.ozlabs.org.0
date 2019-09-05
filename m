Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32157A97FA
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 03:18:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2rX1GP5zDqx9
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 11:18:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="seYXsDbB"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2r66SFVzDqwY
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 11:18:14 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id t11so465375plo.0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOKMw2jcpWSfAVFD5eBvmEjvr87ebRMD2VX465NN5Sg=;
 b=seYXsDbBVkkBeGmoRMlnqWzqu6QQDunzxm9EqggJOSnwwAy/0PDId09u4eRbrfJSy9
 k0AbCRVfBIzoY/qzzVPXqzhIMhLGcdo4rtdRoulpGnQEwgTdeSoFrRLN/JzZfU6G25CD
 zskgEN2eTbkH0iv6cgQH5YPhUOP1FDSvm4BGkHa4Q4T4FRocntm6qf3zmRk1wjL40Jh5
 PkZrAR5lq5QVY5iI3KeSfWUlftcv8mSaFoLqeoz0XSJUQIxsAhSMdJihljDhzBJYpkK5
 vQ6IyvMvrOz7T6qmB5+X8qQ5clqOT+qPBJnk6oKrsJF4zVQylWrTRxwGX+uwshJb/FcD
 n9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOKMw2jcpWSfAVFD5eBvmEjvr87ebRMD2VX465NN5Sg=;
 b=NeLaVj8jB+6lPfxEZ0C5jF7cq+eU0BWiiTeVzNaLBcM3KyjxY9enHi+9gLMuTsE+vw
 LFqiCkn2IHFyYzTEeDAjWi2azmDW1NshPRtcA54J/2o+Z4nMZm/Uw2UPcnXLrwx7XeiU
 oPKAfaS7rBZohe48agR7n7ja3XuxR25hyBMx0PrXXXDLWFPHbq2U03PNRHfSFMM6jjz8
 k+h2UiQOICXMh4j7TPxgyHkExJuEfHrtd7JwNojD07gNyz/qlFGpZ0M6tcXwzJgfjr3w
 uA8RdgWIlDyTylMRczWCPQ64i+c2xBuZuLKW9i7hNEkwGhuqrceMgPtyYrvWfU9rF2zJ
 LPkw==
X-Gm-Message-State: APjAAAUiGPZdiF1XRHoVlMbShNQjbf1jsYVKrdip6qQdJjsKvNsBB6TZ
 7+mZzE22jQBzfKDhcPfkH+c=
X-Google-Smtp-Source: APXvYqx8uRB7lBCyyutl4aJiUHVVKVPeb3t1GNcMZplvM/Fu94gSyRW7iU7NMcCuQj+38WYmeNQvRA==
X-Received: by 2002:a17:902:b604:: with SMTP id b4mr679217pls.94.1567646292377; 
 Wed, 04 Sep 2019 18:18:12 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id u24sm315924pgk.31.2019.09.04.18.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 18:18:11 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v2 4/4] gpio: dt-bindings: Update documentation with ast2600
 controllers
Date: Thu,  5 Sep 2019 11:18:00 +1000
Message-Id: <20190905011800.16156-1-rashmica.g@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The ast2600 is a new generation of SoC from ASPEED. Similarly to the
ast2400 and ast2500, it has a GPIO controller for it's 3.6V GPIO pins.
Additionally, it has a GPIO controller for 36 1.8V GPIO pins. These
voltages are fixed and cannot be configured via pinconf, so we have two
separate drivers for them.

Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
---
 Documentation/devicetree/bindings/gpio/gpio-aspeed.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
index 7e9b586770b0..cd388797e07c 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-aspeed.txt
@@ -2,7 +2,8 @@ Aspeed GPIO controller Device Tree Bindings
 -------------------------------------------
 
 Required properties:
-- compatible		: Either "aspeed,ast2400-gpio" or "aspeed,ast2500-gpio"
+- compatible		: Either "aspeed,ast2400-gpio", "aspeed,ast2500-gpio",
+					  "aspeed,ast2600-gpio", or "aspeed,ast2600-1-8v-gpio"
 
 - #gpio-cells 		: Should be two
 			  - First cell is the GPIO line number
-- 
2.20.1

