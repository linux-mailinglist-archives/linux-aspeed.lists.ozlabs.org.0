Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 535D193D124
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 12:29:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SwVEZ5Ll;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVkWh1p5mz3dDJ
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Jul 2024 20:29:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SwVEZ5Ll;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVkWZ5Gp9z3d8D
	for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 20:29:14 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3db18102406so546899b6e.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Jul 2024 03:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721989751; x=1722594551; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=taoLvNSxvJvDSIyoezhhEapktK4CQP/qTkZDErUBC00=;
        b=SwVEZ5Ll1gJWKzTs+OEdMuMLppetG5kcRYz7t0Ht4TQi70RUKZ3ZYh4QThCavTF++w
         2qBtVNmUiKlrDr6dtKrG9jbCGMSetSD1CrSUs1Lyj7ULpMalccOl7Jti/bVjrzXGDg7i
         2icdwjyaO8PQJU4W/0Ve5yh+xy4d1LubeIuLLuTEgIy1Ffx2nfe2ijnYn4I2dC9gKovM
         Ucwg1Ol3Si5/9iMl9f/GASmVKsPLNpO4NFyaccz5bGO4AxHHNs2qRjZ2wkTYUOnxPTLA
         V8iTfjPJ2LCDV30dWFgscWys0quQzgLGdzDz+RDniNZSs0PrnvOg2gmssT9s/WGkyXPb
         GYTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721989751; x=1722594551;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taoLvNSxvJvDSIyoezhhEapktK4CQP/qTkZDErUBC00=;
        b=DTc7GfNeE0VIgNWsjUU3n16fO/HGyT95z3XKaoxf3faGDSyZI11SAgEHtePF4V9U0B
         uEQBuc9L36OvweK/6/r//ZBvmN6Gsf60+zJQX/N/gg3OUgMn4QfFFL2Ujj60rwL8P3GV
         2OMf3Gt4b36H3crgOHI70z3gtLff9J8mKPsrXE3zQLRqgOCUbV4J/yjPScC7RpY/ksWS
         HD8xBajWUDurucG76yY9og9duOPyjSXjOwqAm+iJdTBv2oXXzeCHyUGApkJKmAINksFj
         Ts4g1Q2oHPA1121lt/LomAki+9+n1/hR3YYFz3NH6joXqZVvjBNJwF3iSD6QklB4tOUR
         079Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxF8ol9P3PADDjo+bll/MLIuXeEjMo50Z6XANuFfWlgyuItjy7Vk7pemUj/DroukUmB4lAeVzVbVGDDzzyS04TCrJnj1Gz2ZwwTikYdg==
X-Gm-Message-State: AOJu0YyGcaxnJESQdmXj6D3V1dRdStkROJYGY9gIMhYgMU69wnpH8tdX
	PZlBMrrY09jioqGK4rqIPdjFlL/QdbqL5tuy0bEQytLwLV5RGb4+
X-Google-Smtp-Source: AGHT+IG+DdKxRpU/fq6Ap6ktwC6YKBP8zhxIdBKlVK/dF6FJRoOcQcCcLikI4ou0llcy9suJ13nImA==
X-Received: by 2002:a05:6808:2003:b0:3d9:244b:b9d3 with SMTP id 5614622812f47-3db140a4921mr5310951b6e.23.1721989751139;
        Fri, 26 Jul 2024 03:29:11 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead8116a4sm2406545b3a.130.2024.07.26.03.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 03:29:10 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v5 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Fri, 26 Jul 2024 18:26:48 +0800
Message-Id: <20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOl5o2YC/4XNSw6CMBCA4auQrq3BPni48h7GxdAOMAlQ0hKiI
 dzdwooYo8t/MvPNwgJ6wsCuycI8zhTIDTH0KWGmhaFBTjY2E6lQaS4UH91EAzcwQUcDcDsFXlu
 4IEhR5tWFxcPRY03PHb0/YrcUJudf+49ZbNOf3Cx4yisorMq1iVvy1vRA3dm4nm3cLI+E/krIS
 EjQlbYlZrYyn4T6T6hIAGS1kBoE5sWRWNf1DbDDNHE6AQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721989748; l=1681;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=S8ZOFlqmcgPcpi9udVpIP3DnsEMtZDW/eFoHOzRFOjM=;
 b=7+JQIry5FaNhIM8qrgeiO9DO1/O3ekdaSP3aOVavYM+XGLff1kurGft6IBruHlbOCIcOXRIoE
 NaVkNb81cyHAZQaeb6Q5sv9BvFv2xnbtWP4eGpdn2lzOv0K58TrW6Vg
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Linux device tree entry related to Meta(Facebook) Catalina specific
devices connected to BMC(AST2600) SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v5:
- fix spi1_gpio node name and properties
- remove undefind properties in mac3, i2c7 & i2c11
- Link to v4: https://lore.kernel.org/r/20240725-potin-catalina-dts-v4-0-aa6f235a2e78@gmail.com

Changes in v4:
- change back io_expanderX due to parser error, build passed in v4 version.
- Link to v3: https://lore.kernel.org/r/20240725-potin-catalina-dts-v3-0-3a5b5d9e6dbc@gmail.com

Changes in v3:
- rename tmp75 nodes to temperature-sensor
- rename tmp421 nodes to temperature-sensor
- rename ina230 nodes to power-sensor
- rename io_expanderX nodes to io-expanderX
- Link to v2: https://lore.kernel.org/r/20240724-potin-catalina-dts-v2-0-ba8d475c4073@gmail.com

Changes in v2:
- drop commented code in dts
- rename i2c-mux channel nodes as i2c1muxXchY
- rename gpio expander as io_expanderX
- use "stdout-path" instead of "bootargs"
- Link to v1: https://lore.kernel.org/all/20240722145857.2131100-1-potin.lai.pt@gmail.com/

---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta Catalina board
      ARM: dts: aspeed: catalina: add Meta Catalina BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1016 ++++++++++++++++++++
 3 files changed, 1018 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240724-potin-catalina-dts-fda1ea3297b1

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

