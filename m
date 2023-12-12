Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BADEF80E52B
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 08:54:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OHg5q+nk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sq9qW1rfPz30N8
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 18:54:15 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OHg5q+nk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=yangchen.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sq9qP11qJz2ys9
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 18:54:07 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-286d701cabeso5197433a91.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 23:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702367645; x=1702972445; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pzU9Yc3xVoAF9cxNzwOqU7U+458n+BSBqv++lU30Lio=;
        b=OHg5q+nkEo+cDaXRX5oTEq0/BgtCl1cqNNXj8RzGXkxY9KyAOw6rX1TwKqY4pN0pLB
         bmbJRN67XjmZXumKB3zQhoonQRezDo7u9o7yauiFIHgw74v7aLlns92J9kRwIcSM/SsS
         LLyM0xsQEWBPEFwSbq8aMSNKtMEPwxYXYfmi91IXTBtjaHu8k0+gBPEIFT0Am73nOHzI
         4Ovw/vYzE6sStOm+Yy2kITzjzbp9rVRLtYIwuyn+h8cu8KHQTkaVqAMMTkX4aj/D4Yho
         0R8/0/HD1Uh9R4mczojjg+pDPbBbHl0nQV2F5rTlpu7cXTZCtyiCl55NolaoftqbRx4A
         gWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702367645; x=1702972445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pzU9Yc3xVoAF9cxNzwOqU7U+458n+BSBqv++lU30Lio=;
        b=W3/r5LdzbQDWTYm0KK0Zjshj7LJUNntQ/Qj1vsoEMM/I51dd+HBIUsZVYL8IjFR6B4
         DPQrAkIW8iG+NGY0eeyeYfI9ytjO8z3uhIOmFn45CqmFcgVOj2saKHQ+XkFUEu0PMK7F
         wsdx420xIi3KIZmzR95RlkQYlP8P5uD5Oywl9DM3pd8R3uUJIFJSfmuc/pFq5wMgWiPB
         VLCRDVVfvLDQh+cWVJFyx1B30k+vmwfNP8X/pYfC4h81/tYiSDN7CYMXXl6C61UXjoo3
         KwNSKyacwx7H+ImflR2NLZHMQeRweKjvmD4mBaeUzvqJ+H4blv9dK0porHaBV/nQj5A3
         I9pg==
X-Gm-Message-State: AOJu0YwfbP/NibsiRvobLOUXyQdslrfEjZC7t651H6qxBm+dsz6fw5SS
	VTtSKyC70qlAXrZGXp/unJQ=
X-Google-Smtp-Source: AGHT+IF9QOtT9bgf09S0s6FLsU+B+rMIlxmiXzYlaVAex8M5R6qkgptzQp6LAgFBgT4dpzbLPq47gw==
X-Received: by 2002:a17:90a:ac07:b0:28a:ad8c:c122 with SMTP id o7-20020a17090aac0700b0028aad8cc122mr1441251pjq.40.1702367644848;
        Mon, 11 Dec 2023 23:54:04 -0800 (PST)
Received: from obliging-System-Product-Name.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id qi9-20020a17090b274900b0028a28ad810csm8144319pjb.56.2023.12.11.23.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 23:54:04 -0800 (PST)
From: Yang Chen <yangchen.openbmc@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] Modify DTS of META Minerva CMM BMC(AST2600)
Date: Tue, 12 Dec 2023 15:51:49 +0800
Message-Id: <20231212075200.983536-1-yangchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jerry.Lin@quantatw.com, Leslie.Tong@quantatw.com, EasonChen1@quantatw.com, yangchen.openbmc@gmail.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This series modifies the DTS of the Minerva CMM which is the board on the
META platform that uses the ASPEED SoC(AST2600).

Changelog:
- v1:
    - Rename the name of the DTS from aspeed-bmc-facebook-minerva-cmc.dts
      to aspeed-bmc-facebook-minerva.dts.
    - Revise the setting of the mac3.
    - Change the sgpio use from sgpiom1 to sgpiom0.
    - Enable power monitor device (INA230 and LTC2945) on the i2c bus 0.
    - Add one temperature sensor on the i2c bus 1.
    - Correct the address of the eeprom on the i2c bus 1.
    - Add bus labels and aliases for the Fan Controller Board connect to
      the i2c-mux on the i2c bus 2.
    - Add led of the fan for the fan fault.
    - Name the gpio and the sgpio.

Yang Chen (11):
  ARM: dts: aspeed: minerva: Revise the name of DTS
  ARM: dts: aspeed: minerva: Modify mac3 setting
  ARM: dts: aspeed: minerva: Change sgpio use
  ARM: dts: aspeed: minerva: Enable power monitor device
  ARM: dts: aspeed: minerva: Add temperature sensor
  ARM: dts: aspeed: minerva: correct the address of eeprom
  ARM: dts: aspeed: minerva: add bus labels and aliases
  ARM: dts: aspeed: minerva: add fan rpm controller
  ARM: dts: aspeed: minerva: Add led-fan-fault gpio
  ARM: dts: aspeed: minerva: add gpio line name
  ARM: dts: aspeed: minerva: add sgpio line name

 arch/arm/boot/dts/aspeed/Makefile             |   2 +-
 .../aspeed-bmc-facebook-minerva-cmc.dts       | 265 ---------
 .../aspeed/aspeed-bmc-facebook-minerva.dts    | 543 ++++++++++++++++++
 3 files changed, 544 insertions(+), 266 deletions(-)
 delete mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dts

-- 
2.34.1

