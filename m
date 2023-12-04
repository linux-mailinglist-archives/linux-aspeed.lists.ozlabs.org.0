Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49C802B66
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 06:43:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VEH4DunV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkCJk4gf7z3cHF
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 16:43:50 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VEH4DunV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkCJY2BF3z2xm5
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 16:43:40 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3b84e328327so2117684b6e.2
        for <linux-aspeed@lists.ozlabs.org>; Sun, 03 Dec 2023 21:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701668615; x=1702273415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcCMUyyydpcNnF03FcPhsepyrQYojahu/1jDYu378E4=;
        b=VEH4DunVwkYGIXHI0UWa6AkDq4N0xjf5ne3Oij0cBc/Dg/JMbOzcBaBuMB0zaArVYt
         YorxOQoe0Vmc9wC1Ra/YsNMsgi4Xdgb+MAEiKo5MhtAq/AaZrrRPmsmwyir7JXYywbL0
         K2E4KODbA4VQifMwufwMgHduAUCne1m1lrhSRz85+J9QAcPdsx9KwkNiaehK+KPCbGra
         QoKhEqzjF+xhjN7cM/Qf7dX+zPQvTIMHVzB2QwXy6YmZTIOUVwwGqR2rb6GwnJmdC5J9
         gJSJRHlg3PTzWWK31r4wNgSzYG4CLnm/rQymRp0/ttnZpLQ7vnQuzPvEkVOT5luVYxK8
         z/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701668615; x=1702273415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dcCMUyyydpcNnF03FcPhsepyrQYojahu/1jDYu378E4=;
        b=agAnff3+rnpJMUp4XJR8cTsy3ByULFfk7Spqa7v3tGksOTsNQnV6EYa7pnJZz+MDBr
         Ee/5+sUjBSe3t4oeimZemAOUuU8puHD8qpVj6prdCpuFx4/8HF8QIfQvX7+9F42NXOzA
         jk2g83QAoOroY4/dtJKRzWZwaZAHAfpKOpllfN3zLlfRleFMHY8f0oFK32TeLQlqbVzQ
         W0tLU5RAcH76q0Lrx7fLHgCjNtJVMPu2L47UDL9nCV9eUqmvF7i18VKF2FTvikk36fqL
         wiuS8oWVyt1y8MWd1pAsi4O8sz7c+mFMXURLzLcpBMd0YJSBvW7Dqog+DNGGTmYMBHxH
         qE1g==
X-Gm-Message-State: AOJu0Yx0Qr9hFS3A8e6GcV8Ds4ZerVAmyxCMouzKkKGaBJpqX7BK1BgV
	iQbvINWTjCxB21PMwy+RUlQ=
X-Google-Smtp-Source: AGHT+IFTOzBkVsPxCRaAgiG/sz4j3LTI9aTnCdfxa2sXDtV2sN9jZzX/bAv4WhcKefI3AGAPnJCNqw==
X-Received: by 2002:a05:6808:128f:b0:3b8:b2cf:3106 with SMTP id a15-20020a056808128f00b003b8b2cf3106mr3844218oiw.25.1701668614921;
        Sun, 03 Dec 2023 21:43:34 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id b24-20020aa78718000000b006cb60b188basm6706655pfo.206.2023.12.03.21.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Dec 2023 21:43:34 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
X-Google-Original-From: Peter Yin <peter.yin@quantatw.com>
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
Subject: [PATCH v4 0/2] Add Facebook Minerva Harma (AST2600) BMC
Date: Mon,  4 Dec 2023 13:41:29 +0800
Message-Id: <20231204054131.1845775-1-peter.yin@quantatw.com>
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

From: Peter Yin <peteryin.openbmc@gmail.com>

Summary:
Add linux device tree entry related to Minerva Harma
specific devices connected to BMC SoC.

v3:https://lore.kernel.org/all/20231123050415.3441429-3-peteryin.openbmc@gmail.com/
v2:https://lore.kernel.org/all/cdbc75b9-3be1-4017-9bee-c8f161b6843c@linaro.org/
v1:https://lore.kernel.org/all/20231024082404.735843-3-peteryin.openbmc@gmail.com/

Change log
v3 -> v4
  - Add SGPIO line name

v2 -> v3:
  - Fixed led schema
  - Fixed i2c mux schema
  - Add BMC_READY and SGPIO_READY

v1 -> v2:
  - Add Power sensors
  - Modify ehci number
  - Add Led
  - Modify SGPIO line-name
v1:
  - Create minerva harma dts file.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
Peter Yin (2):
  dt-bindings: arm: aspeed: add Meta Minerva Harma board
  ARM: dts: aspeed: Minerva Harma: Add Facebook Minerva Harma (AST2600)
    BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 595 ++++++++++++++++++
 3 files changed, 597 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

-- 
2.25.1

