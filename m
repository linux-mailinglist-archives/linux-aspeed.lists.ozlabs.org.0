Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E633E93B4DA
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jul 2024 18:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ao9Spajt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WTfRR1yM2z3cWY
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jul 2024 02:21:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ao9Spajt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WTfRK12b7z3c9c
	for <linux-aspeed@lists.ozlabs.org>; Thu, 25 Jul 2024 02:21:47 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1fc611a0f8cso10237525ad.2
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jul 2024 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721838105; x=1722442905; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jCjlyepMSMynmD+rlgKER3fIjctnf991YR04zeZ0yNQ=;
        b=Ao9Spajtw05KzxNHHzssKQUSANA3dW0R2XpEYKvVw2++krLeeduzHn9D3ukWMpZxd8
         1ol4hZJRNYZ1EzH1l25hJazkNRawzUcPfU2f9/W3X68VJO2D8UyIXdGRaftnCagupNcB
         22u5qlCN0mxrQSfJkITEV4dS+i4wQw0MBQZIYSN42BSz12cz1dFvnt+Gzwv2xaxJZWcM
         FAq3/e35GRvNtqpbLQmqPNtbX6emFhPkIJhfT7vgfBlIAiJoLoQqu1AB3pCS0e4KePO1
         AvuHIC0cPLp6tbxoChx8H6JMw0RYYKXSS+nNoAMwgapT/c2pz5CF7ckT+ObO5p+VvspR
         /SYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721838105; x=1722442905;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCjlyepMSMynmD+rlgKER3fIjctnf991YR04zeZ0yNQ=;
        b=wkwG2TTLm0X9XqxDSzaq+jykUKrHIPOd2raFqdSJEjhOUPapT4ARIZNWUIaTYiJ8DL
         kszMZBGMmQ/ctD28e9FYtctHUOKawqjvhqOyba7KO3WU0AXytRwuCv4EsIeZIeJ5DxTD
         h6z9HXVS3ugbers6z0U901xJpp+F+P1QUdYVsa2kIdfDD+k2AxFyFZIcg3IdZKBQDJbt
         nQFYpnUcTpNPeHTPOPadkxTK5uYXMZ/rtR5nFJ+lKC8wYvqGGqTEVWtJzGLgY/PGpZvY
         7GKZSkXVr/MeQuiU7+ZVThVwYHGwjn+d3fGZhRXfrHPCbZP4CM+4K9cH5KO6BIEhDKMH
         culg==
X-Forwarded-Encrypted: i=1; AJvYcCWOvGCmkSaNIgOsAGupZClxj1tX2EYfKVVtEZ48SuuvzsXqY5KfpS4RlY1+wx3/HqLV3CjNhd164Bk92OG6nfFDehrGLoa/bLuOSAW7oA==
X-Gm-Message-State: AOJu0YwzLkX0UOPXVWxq9DkxeKICEZ//u2pNgjtcL/1Z/FAL+Jq5v5jT
	0JfbOahJQSjK0nXG0c8msJvYOfo63e4YFpCwSvEkuOp7KPKd8KpU
X-Google-Smtp-Source: AGHT+IEaHyX4rKl7ZB80zmsR5sXUua2/ZJvAuV4RsfEazSnJ/eAErqgeZOPe0vCi037qpxQzPdbjfA==
X-Received: by 2002:a17:902:dace:b0:1fb:5574:7554 with SMTP id d9443c01a7336-1fed38a191amr563385ad.28.1721838104565;
        Wed, 24 Jul 2024 09:21:44 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f31bd9bsm96159635ad.157.2024.07.24.09.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 09:21:44 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v3 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Thu, 25 Jul 2024 00:19:17 +0800
Message-Id: <20240725-potin-catalina-dts-v3-0-3a5b5d9e6dbc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYpoWYC/32NQQ6DIBBFr2Jm3WkUaWi78h6NixFQJ1EwQEwbw
 91LPUCX7+f/9w+INrCN8KwOCHbnyN4VaC8V6JncZJFNYRC1kLUSEjef2KGmRAs7QpMijoYaS61
 4qKGBMtyCHfl9Sl994Zlj8uFzfuzil/7V7QJrHOhupLrp0mq7aSVertqv0Oecv3Y22fK0AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721838101; l=1010;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=u+8sQaElmmUTGYE88vHZLs/dmfNY6c2B4ktHc+O+ePA=;
 b=sE4zAb8myOf5e2jTC2Cd+B6ZFVvenRADe5LixLy60a3S7vSr9j1xAlWNiu/fkq3Y7MKlPOVLo
 D9esJbmXWoqDKvJepurspIR8QHM+BaCxKAmYYFmQ4RWeZw6Gn1ndbnN
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
Changes in v3:
- rename tmp75 nodes to temperature-sensor
- rename tmp421 nodes to temperature-sensor
- rename ina230 nodes to power-sensor
- rename io_expanderX nodes to io-expanderX
- Link to v2: https://lore.kernel.org/r/20240724-potin-catalina-dts-v2-0-ba8d475c4073@gmail.com

---
Potin Lai (2):
      dt-bindings: arm: aspeed: add Meta Catalina board
      ARM: dts: aspeed: catalina: add Meta Catalina BMC

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    1 +
 arch/arm/boot/dts/aspeed/Makefile                  |    1 +
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 1020 ++++++++++++++++++++
 3 files changed, 1022 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240724-potin-catalina-dts-fda1ea3297b1

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

