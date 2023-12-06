Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A380740F
	for <lists+linux-aspeed@lfdr.de>; Wed,  6 Dec 2023 16:55:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ik7r9LMN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Slhng02tzz3cT7
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Dec 2023 02:55:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ik7r9LMN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlhnT5yHsz30h0
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Dec 2023 02:55:24 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5c68b5cf14bso2365507a12.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 06 Dec 2023 07:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701878120; x=1702482920; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DUpYtMlNxQPfOzxOCnWpcnmDSR+IsHfxAwKdMisAiWU=;
        b=ik7r9LMNHEXWOnMSgKWfcifm+BTfDSepPvaQxNFMYRLszcpirzd+GojHQ7XUXkauOQ
         vakM6cARggUD1bD6l3qnvXFUjgXHed0jHZ0HPMQkWh+A3c2neKEtwQQOpGpU9v6eJNNS
         /KHRsaUrFz6VoKeEqXlrqwNeg1YKe2laPF4MmZ+9j+wpQ0bsLsLWmyei8s+SNur7rMBm
         OvfhjM7dWrSuTOGedVYMhqcclc+xOcWp1CamqrE//z10H+L2SmXKGl9M+Yjhj612I8pI
         j3URzAswLaG5wWa17fde4L3fdeDhJHnUORr9BZ7IOXUYzGzG6iU+aDOVgXUARRqKYJN2
         MKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701878120; x=1702482920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DUpYtMlNxQPfOzxOCnWpcnmDSR+IsHfxAwKdMisAiWU=;
        b=eAWDMwuxEAexXmf9wIYPF8jAMh98Y5qPSdk+4H5oKBANgCY8IGyqVmQ9Fe6w66shzZ
         FRU5HyW/Dp37lq7KJqeuVcG97b2kKiQTWSCsGkqAwVBX8aW1n/6KPvTZdqysAh2sHR89
         BUPTE1jAtJ/Y0lFmn0FU5ar7pWs0j4U5Vft/x2ygb9hbUA8ehjtf38oZ9IyYLcikMlL/
         5Egdelxtn9W6fuuaMyZksIjmB3Ai0sPbRWY/mLh2HIX+DlIeLCetIq3PVTiDzeRGL+Eq
         ziVpJid2i0LRihq5HKTBvcZvu4DubN5xyJIh060LapXtz7uCYc8dcX6j37L49DcgCixe
         +rQw==
X-Gm-Message-State: AOJu0Yxiy7fG8D/Xw38BR9nGnUvY/b8AJMuKpVBvW18iC1w9dvcX4H0I
	05QM4ltKehYT/axxViNqEKs=
X-Google-Smtp-Source: AGHT+IF/hwdQAeKwXxZgHJD2ZuhMZBTgnDN1LF/oZsKXET9Mvdm4nje4XCYAICgG3G2R2vDdbrDSkA==
X-Received: by 2002:a17:90a:19c5:b0:286:a2a3:1e56 with SMTP id 5-20020a17090a19c500b00286a2a31e56mr786838pjj.29.1701878120253;
        Wed, 06 Dec 2023 07:55:20 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id sj16-20020a17090b2d9000b0028652f98978sm3451pjb.8.2023.12.06.07.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:55:19 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/2] Add Facebook Harma (AST2600) BMC
Date: Wed,  6 Dec 2023 23:53:13 +0800
Message-Id: <20231206155316.4181813-1-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Add linux device tree entry related to Harma
specific devices connected to BMC SoC.

v5:https://lore.kernel.org/all/20231204081029.2272626-3-peteryin.openbmc@gmail.com/
v4:https://lore.kernel.org/all/20231204054131.1845775-3-peter.yin@quantatw.com/
v3:https://lore.kernel.org/all/20231123050415.3441429-3-peteryin.openbmc@gmail.com/
v2:https://lore.kernel.org/all/cdbc75b9-3be1-4017-9bee-c8f161b6843c@linaro.org/
v1:https://lore.kernel.org/all/20231024082404.735843-3-peteryin.openbmc@gmail.com/

Change log
v5 -> v6
  - Add Retimer eeprom
  - Add Power Led
  - Add GPIO/SGPIO Line Name

v4 -> v5
  - Rename document and file from minerva-harma to harma. 
  - remove Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
v3 -> v4
  - Add SGPIO line name.

v2 -> v3:
  - Fixed led schema.
  - Fixed i2c mux schema.
  - Add BMC_READY and SGPIO_READY.

v1 -> v2:
  - Add Power sensors.
  - Modify ehci number.
  - Add Led.
  - Modify SGPIO line-name.
v1:
  - Create minerva harma dts file.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Peter Yin (2):
  dt-bindings: arm: aspeed: add Meta Harma board
  ARM: dts: aspeed: Harma: Add Facebook Harma (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 607 ++++++++++++++++++
 3 files changed, 609 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

-- 
2.25.1

