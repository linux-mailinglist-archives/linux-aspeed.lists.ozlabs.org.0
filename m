Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D980D1B3
	for <lists+linux-aspeed@lfdr.de>; Mon, 11 Dec 2023 17:29:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4Us3KfK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpnJ808mXz30YR
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Dec 2023 03:29:12 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f4Us3KfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpnJ016nYz30YL
	for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Dec 2023 03:29:02 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d0a7b72203so40748045ad.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Dec 2023 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702312140; x=1702916940; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P3ff7o7n+FjuYNe8xqkpUwOybfn2phT/0e/964mkD/M=;
        b=f4Us3KfKES6AWWoAQV4fXUJbvvxcKx+d2nMYDwbmVZgvGlXGut3ztihufQSt09UV7M
         50dVori3Y1pqbo/qc41c9BpF4ecQKQfpSrqJstq31mD5JXYo+MjH3gKpvEJZpGe6UYAi
         ScDtxeuzDomnRWRHJe0vF9Zow7wbIqRwhFlh+wRpSh3nbj3QuYzc9cU/4zFAC5Zfj2X5
         NJAtTThkkQKHhMFdlIkmGp4xQ1Pk7Q+fsf/fxKt9oyJmNb70747CiHYVpWnIytw02938
         QXUsE9BY1hjLBCeX2oE57cTNZGeN2EwE3TEBjHN/3GehhXlTB7bn5celHqZi5C9vbOmF
         WRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702312140; x=1702916940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3ff7o7n+FjuYNe8xqkpUwOybfn2phT/0e/964mkD/M=;
        b=PrbZ0uYN8ppK6BppEgy6ETgyoNL+B23ldTgJvy5s7D+BB8dXKxqcty2KksmnavC8Cu
         4halCNwG8Re2TVhhxne2nHBUi3Y4zehVBmeILszXeReVoi9xjomVBgiuMQk8EEHhKSuy
         xh61Yb7B6w9WTixoQ97P9HpgKT/aDqEr+1eKQuAFNey27sAZwHi5tmqkC4rSyM4Ze3tZ
         SeTtBwLPMV4WLnFjbzObbrB7KyGkbK8RYAWbkyk+qaOSAAjwqjRHq6tvvef2/4PsGS9H
         UUwT6fa9HSNdhbRSsFoV5Kl0HYMfmJ/dE1xe2tYezHsPkksnQJbmNVU3EmGQzjJ72iO6
         2Yvg==
X-Gm-Message-State: AOJu0YzvZN5ycj0j/muesAXVq+JrwTunCwWuCL7lOZ0PWqZ9yhk9woBd
	bshFUilBRgfCFyP/rFWoIjg=
X-Google-Smtp-Source: AGHT+IEAtUxVc1PSHY7J/29fTiTIIP0Fk+vZwO2uR/EFTtpt/Iwktg1HRVKUdvidyUdDnvYocaOpnw==
X-Received: by 2002:a17:902:c782:b0:1d0:c888:d128 with SMTP id w2-20020a170902c78200b001d0c888d128mr3774697pla.92.1702312139775;
        Mon, 11 Dec 2023 08:28:59 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id ja1-20020a170902efc100b001d04c097d1esm6867888plb.271.2023.12.11.08.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:28:59 -0800 (PST)
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
Subject: [PATCH v7 0/2] Add Meta(Facebook) Harma BMC(AST2600)
Date: Tue, 12 Dec 2023 00:26:53 +0800
Message-Id: <20231211162656.2564267-1-peteryin.openbmc@gmail.com>
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
Add linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

v6:https://lore.kernel.org/all/20231206155316.4181813-3-peteryin.openbmc@gmail.com/
v5:https://lore.kernel.org/all/20231204081029.2272626-3-peteryin.openbmc@gmail.com/
v4:https://lore.kernel.org/all/20231204054131.1845775-3-peter.yin@quantatw.com/
v3:https://lore.kernel.org/all/20231123050415.3441429-3-peteryin.openbmc@gmail.com/
v2:https://lore.kernel.org/all/cdbc75b9-3be1-4017-9bee-c8f161b6843c@linaro.org/
v1:https://lore.kernel.org/all/20231024082404.735843-3-peteryin.openbmc@gmail.com/

Change log

v6 -> v7
  - Remove mac3 and vuart unsue property.
  - Rename the GPIO line name to match OpenBMC naming style.

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
  ARM: dts: aspeed: Harma: Add Meta Harma (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 585 ++++++++++++++++++
 3 files changed, 587 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

-- 
2.25.1

