Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E367D49F4
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Oct 2023 10:26:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B9UXjyY4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF4sG4qfSz3c5P
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Oct 2023 19:26:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=B9UXjyY4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF4s605GKz2xdb
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Oct 2023 19:26:15 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cac80292aeso24646945ad.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Oct 2023 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698135970; x=1698740770; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ElAJ7T5lyM2rNfb9sdirLY+VRjlwidQbRBMl87dIYmA=;
        b=B9UXjyY43YmCOxEmSdg6nfAbqz9f5vGYJzDCEkiwfEV1SC7XPykY3K165D1FgBso4X
         hZwhkCZomnpdwGo1QjHl+emhv+CeaqOcDfA3IRPrNX8BMdtn50Ntf6DG7ChW0D8FAi62
         ioxNA5qef9F5Nc9liI7SsgpPdyv/1hiSbqU8j0VcD84jEJnPgQn2l4C/dCbvQt3OjSCF
         cCck07MC5cmgyKXJRo7Tex/7XOiLu5w1GMJHNOnWNiG08S5Ncrslm9781vdzABA2fdDy
         SVQCk0cNSmu/vvLGQdbmkO39iVmPwR6xVjb7oIVliCQju2UQuvPctc45tYhbObxVdEin
         BmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698135970; x=1698740770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ElAJ7T5lyM2rNfb9sdirLY+VRjlwidQbRBMl87dIYmA=;
        b=aLYNn5LTDtE9zK1VNP/grYhLw56RCI2/AulRsYjbey+d5B+kOWV7EdCjW01kUm81oV
         MZ1Ni9ZbHE9kfAwKGWB5HzCAyv9BRVDQ35go8Bi7FV7hDHTd3O2hkC7+Ofy/Dceyl+7N
         ftoUbXrIsQoMDUcMgQ2z+j7LmdX/2JFcXcEyUeDjPzy87wdy/KEwiH77HD3GYj1wZNv2
         EvWCItl73e1SMWs7spgu8ZeK+qzYYmawTZiL1kwmHLfQuy6K2u5ZaJmzy3eZRd1DXis7
         jOqZQx0KjkJXIus9pyk8q+8c0qLDFWx6VCzOgk+WW0xRtg64Km6A71rld9BsWmaTVD9X
         hvZA==
X-Gm-Message-State: AOJu0YyCWiilqH5embyY2t/yNb7IWpe8TOxJue77snmgRXidMOwudP88
	czyTCwsp9be+0y5wAewDOV4=
X-Google-Smtp-Source: AGHT+IE7Sdfd2gCzc6kKD7SwZlRXbF1gQ7AoSLA/Lok7KF+6ZMR9Nyn9J0rAXXPFWPaZ9osXwKzFyQ==
X-Received: by 2002:a17:903:3211:b0:1ca:4d35:b2f3 with SMTP id s17-20020a170903321100b001ca4d35b2f3mr7282603plh.67.1698135970656;
        Tue, 24 Oct 2023 01:26:10 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001b9c960ffeasm7010665plx.47.2023.10.24.01.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 01:26:09 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Add Facebook Minerva Harma (AST2600) BMC
Date: Tue, 24 Oct 2023 16:24:01 +0800
Message-Id: <20231024082404.735843-1-peteryin.openbmc@gmail.com>
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
Cc: Peter Yin <peteryin.openbmc@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Add linux device tree entry related to Minerva Harma
specific devices connected to BMC SoC.

Change log

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
 .../aspeed-bmc-facebook-minerva-harma.dts     | 484 ++++++++++++++++++
 3 files changed, 486 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-harma.dts

-- 
2.25.1

