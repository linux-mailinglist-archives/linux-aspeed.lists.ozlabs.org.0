Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 637D7945A89
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 11:11:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Npw8XmnW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb0S36J9nz3dX8
	for <lists+linux-aspeed@lfdr.de>; Fri,  2 Aug 2024 19:10:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Npw8XmnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb0Ry2fpyz3cjX
	for <linux-aspeed@lists.ozlabs.org>; Fri,  2 Aug 2024 19:10:52 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-70d1d6369acso2249780b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Fri, 02 Aug 2024 02:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722589848; x=1723194648; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GU5qsspMI0fq/9l22SvO0SxLWx7Q8pPDT8Qcq7weLRo=;
        b=Npw8XmnWjUoqVr0t4/061S54sX6g8kbTWyawnnfZfJXc2GPom7PanOQhS3qgnJiQ88
         cH6bjwbwzS4KIrE4C9bjoncOkE9TFO4pi+IOZ5iAhvauwPYxENB717KjUShbfY7u/c3K
         6gUqICQ2IPvYRnJzfouAm+DQ2pI2KhA0zdWHmiLOkIzGhe8LaACbJSSzSeuVGZb/4Ltl
         8Rfp6FIEndWmlJMa4dLOWgcr5wrz5h498mhMJHXxT2Gm80lzf7Py+aDp2xCLIVzxhkkH
         eRdQ7juWe24u1NzqwNdOHpgFD8kW4Rzfv10KMAKMQdyOruWsB7lZhrofzldPXw8upxEg
         FKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722589848; x=1723194648;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU5qsspMI0fq/9l22SvO0SxLWx7Q8pPDT8Qcq7weLRo=;
        b=jl9LZImAIoWrTM23rKJFcKH2/dh0Qu2Tj1j5/6C/SvkKIwE0O5IEgOqgYfK9ap/SDu
         ARSd2V2w9zaRu2BxVnRjAfHERjXNsp2bJ8utYC/VtbFiTj/wWsqosM2ni8PGOUI4P7Tj
         6dO3nvypWj/H0cROvQIYOwKp3uX0pLyfgIaofASFi3KlJdAIV8hedkg6Wj/5+jxuix8Y
         /Qqr0hrAZBb/b4sOEpKxfojgXfGTbFSftjjh0hOVzFXDumib9xGy1y808RWDz7UbWJVw
         Xl2VihFawmPNpLfDdhfCBcURv+mwzNkmPwjXNUSaEhvm0GU/+TuNyER4grF7wy6AqIYe
         kNVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXbmAGRoi/2PGdowIycGx0IxRWcUg6axjtwfsqvG7a0NtN5M+7cPUT6mTvKQ7H5C5dBmEsjFu9LQjudoG/ExT4O9B/hHA1iv0wOCMUXQ==
X-Gm-Message-State: AOJu0YytLTQmdHVL/8p+2tsoAZFkT20E0d5FJjWSg3bgVZXVHW0Dfqj4
	16+X+Ed25LSaGUwgdihRcv8St+IhGsCxhH9YLJ+F8TbkpRrrOecC
X-Google-Smtp-Source: AGHT+IHgpTlOZ1GMTXPn5BCGd3CXDVDrNz/iKy8YI9RfVG+sx/tqctbg8JdQSlpADRRRJ+hh/tKHRQ==
X-Received: by 2002:a05:6a20:7f91:b0:1c0:e69f:f23e with SMTP id adf61e73a8af0-1c69a5bfbc3mr4536465637.9.1722589848110;
        Fri, 02 Aug 2024 02:10:48 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec05bf3sm1034145b3a.13.2024.08.02.02.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 02:10:47 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v6 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Fri, 02 Aug 2024 17:07:46 +0800
Message-Id: <20240802-potin-catalina-dts-v6-0-0b8f61b80688@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOOhrGYC/4XNzQrCMAzA8VeRnq3UtFk3T76HeMj64QL7kHUMR
 fbuVk9DRI//kPzyECmMHJI4bB5iDDMnHvocxXYjXEP9JUj2uQUoMMqCkddh4l46mqjlnqSfkoy
 e9oE0VLbei3x4HUPk2xs9nXM3nKZhvL9/zPCa/uRmkErWVHpj0eUtfbx0xO3ODZ14cbNeE/iV0
 JnQhDX6KhS+dp+E+U+YTBAVETQSBFt+Ergmiq8EZqKMCrRCigh2TSzL8gTeDP9gfQEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722589845; l=2015;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=GA9heUsACbwet20tQDdERhjA0vH0lNx44YL8Ax3i694=;
 b=aqvTebrxPHabbGWV2kNSB0fPx/eHldeuiDNPOT4n6FWLAa6SMpFUDIGxYy5VokvopnG1OJAlI
 JHtJNvBN6P+ASdcu1kl+kFKAJoA02OaN5wSuZs9aDghygs/s02Wzm3V
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Conor Dooley <conor.dooley@microchip.com>, Cosmo Chou <cosmo.chou@quantatw.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add Linux device tree entry related to Meta(Facebook) Catalina specific
devices connected to BMC(AST2600) SoC.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Changes in v6:
- move i2c-mux@70 node from 33-0070 to 30-0070 due to bus change
- fix wrong gpio-line-names in io_expander6
- remove all max31790 nodes
- remove all raa228004 nodes
- remove ipmb-dev node
- remove unused mdio0 node
- Link to v5: https://lore.kernel.org/r/20240726-potin-catalina-dts-v5-0-8f02305af527@gmail.com

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

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 965 +++++++++++++++++++++
 3 files changed, 967 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240724-potin-catalina-dts-fda1ea3297b1

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

