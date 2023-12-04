Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24625802CD2
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 09:12:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mk30RFq9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkGcZ07qgz3cSt
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Dec 2023 19:12:46 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mk30RFq9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkGcN6h2gz3c3H
	for <linux-aspeed@lists.ozlabs.org>; Mon,  4 Dec 2023 19:12:36 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5c66988c2eeso900064a12.1
        for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Dec 2023 00:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701677553; x=1702282353; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ymWLoqyw32xpzTYM5b2NyGhQqjmhcr5ZGIFgQKSGQLM=;
        b=Mk30RFq944UNt34BXI0BwDo6ZhpKMaxNANv271nytbYaJWSrhAznOeSAQK7bKlNPkI
         nNGRmMfEPuFKPfXcjeQSBYCrBNBPG2UjNoVnDNRIcTQg2J7OamHnq8jYAfJhLe9yPUvY
         0OoiPs+h9PDatGqiV5Q46yB7nhIDOJ1oufjBftpa2mvGo88LiWOpB1yb2PwjhmRnWoai
         3IUnYXdpVcOeQNeXW3tMOjTtVoq3u2YdC17QRY2INo+KKHmbA5YFzAkD4/i9aE+wxJ7c
         0Qm4TD52gFXXwWwpQRySV4rgRTTG2X24pMUAfKrOI+YyPk1MJjTw37SjephZxVpmQtlx
         OCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701677553; x=1702282353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymWLoqyw32xpzTYM5b2NyGhQqjmhcr5ZGIFgQKSGQLM=;
        b=niJZQsVDRHPzU2A7PMMtWxXqixRN0uJhNmGXV1/lrq7zB/o+qOyfKScVbl58WQs4RF
         AgEjwWeWqqL4oUIVQXxHMQY8MB12R8Tr2b91C55rBcVkNcuhaFlcpwgueufjXbsreSmz
         F+LKK3U/UvHdifGyR6TEap58h701dxXWCOjVujcyM0LjAdY3V9/QK+AXNfjpDAldDTPp
         adGdCnCC9dZtjfEeGuzOxZZEGQATAlDEpjcx2OFYecFaSWpKxWZfGI8nGKzAUHDHLza1
         ZO7sFq+yKF85jxM4x1utmfAzJei28P4oPyN02DWBz18ugvvKqUh2kMAq2/GyaBLImFeS
         +fhA==
X-Gm-Message-State: AOJu0YxXdT8cB18ut5q7zDKOggAOSOLynY+pTcBHrnxI8ina2NjH7/bE
	0hR2vSNGmnN2QUiEgXz0JZQ=
X-Google-Smtp-Source: AGHT+IEMs4Z8uB/HV8st+VyBKhE7bpWBjxW30G9ABzHC9MZi6oSmOD56Mqwmb34xjcj1Y0FnFaYUjA==
X-Received: by 2002:a05:6a21:9983:b0:187:449d:a4cd with SMTP id ve3-20020a056a21998300b00187449da4cdmr3959920pzb.27.1701677553254;
        Mon, 04 Dec 2023 00:12:33 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id u30-20020a056a00099e00b006cba5c61a01sm7059864pfg.159.2023.12.04.00.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 00:12:32 -0800 (PST)
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
Subject: [PATCH v5 0/2] Add Facebook Minerva Harma (AST2600) BMC
Date: Mon,  4 Dec 2023 16:10:27 +0800
Message-Id: <20231204081029.2272626-1-peteryin.openbmc@gmail.com>
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
Add linux device tree entry related to Minerva Harma
specific devices connected to BMC SoC.

v4:https://lore.kernel.org/all/20231204054131.1845775-3-peter.yin@quantatw.com/
v3:https://lore.kernel.org/all/20231123050415.3441429-3-peteryin.openbmc@gmail.com/
v2:https://lore.kernel.org/all/cdbc75b9-3be1-4017-9bee-c8f161b6843c@linaro.org/
v1:https://lore.kernel.org/all/20231024082404.735843-3-peteryin.openbmc@gmail.com/

Change log
v4 -> v5
  - Rename document and file from minerva-harma to harma. 

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
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 595 ++++++++++++++++++
 3 files changed, 597 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts

-- 
2.25.1

