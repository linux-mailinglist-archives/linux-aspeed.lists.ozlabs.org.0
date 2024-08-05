Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE9947E94
	for <lists+linux-aspeed@lfdr.de>; Mon,  5 Aug 2024 17:49:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RKGeob4t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wd18D3tf8z3cdM
	for <lists+linux-aspeed@lfdr.de>; Tue,  6 Aug 2024 01:49:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RKGeob4t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wd18334vjz3cXZ
	for <linux-aspeed@lists.ozlabs.org>; Tue,  6 Aug 2024 01:49:05 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fd70ba6a15so80222945ad.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 05 Aug 2024 08:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722872941; x=1723477741; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFO+CKVP+ZX8YgWMyMZP5spz1xTqtwC+2nMhN7tO4+8=;
        b=RKGeob4tGwNFGbZ2VrYOIYTTFEi3cE+Ltnc+Yqkn7sy09LiVabeFHeLZ7N3RIIPwXt
         Q8oPbvs1/Xa0+PJ7QZdIzqKoC4hwFt2uz6gDJ+JrZbA5147x8cZumEbqKOXzO73wIPJf
         z1FpogLwgIzkhzPHjMYcFD8vqu3dx5zc9JrvsnadZoy9BCLvbKWGbumi/Ohvfr8YWhVW
         HaFbgoB54y8vVag/5TjqJGGMQ40m19N8Yq1jvhCNTmQVlAxQSfj+2Nc0YtRbn7zp87oE
         m6E8zVgkHhDDc6b/FTRVAl/65kpxf8PMgKk+6FfnKnD0ecUSar9YrRyMuTRicknGU33z
         AZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722872941; x=1723477741;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFO+CKVP+ZX8YgWMyMZP5spz1xTqtwC+2nMhN7tO4+8=;
        b=PDW+8HiRt0wYRlw7RAU/EyGkz8LUP9wLqQtPkxbH2plj3zDoHsU3d1oG0fe6feN303
         mvQWR9CH1T/LZ4J4z0w84CSjNWmxMlpUB9fT9Qh1fI4+gF9OcbZa7RQ/FtkO2au6lIsi
         LdzSD0YVaZNeMNyEwa08IllvJq4Q2/fHQOHMQqFetbQ345jzEAEkyGNa5XfiQp++Gdy7
         qxkYAJHnbdHg2up6GZ5kfx683ImIyyyjuZb4AUoJRxBA3mRkSho6b+wqImq+j7g3xiWI
         yY81nqNP9G6DNi2lcDER7kJsw96TdN8OSYt2OIGYa4seVdrKiHlTjZ3gFPBDwCiujJGS
         AxSA==
X-Forwarded-Encrypted: i=1; AJvYcCVc2QVvv6+TZ86ggvOMxOkcDv7YvBnWFrRZ4iMv3H0P0bo90zDoRhZrKWeVNd63JIvQ9jSOJdXRcJVchMwkpcYAuhTFl5/XX1DmhXsy1A==
X-Gm-Message-State: AOJu0YwFYqsurcOP/FCIlRIiqekztpLP9y5wNaWv42g+Ep9Snv4JCZel
	CWNyk4nNHrfgsU0NBpVap1xyQkbyycK1xuUbdafeUF0UsdmruEHE
X-Google-Smtp-Source: AGHT+IFUAoOQv4oNDH8dPTJXHH3Zd1dU9RwQngBtYbSARcD+2Cq1wpgUNTOasLPOg0N3L133YCmqDQ==
X-Received: by 2002:a17:902:d502:b0:1fb:d335:b0bf with SMTP id d9443c01a7336-1ff57296a09mr129426075ad.25.1722872940983;
        Mon, 05 Aug 2024 08:49:00 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff5929ad84sm69478215ad.270.2024.08.05.08.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 08:49:00 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH v7 0/2] Add Meta(Facebook) Catalina BMC(AST2600)
Date: Mon, 05 Aug 2024 23:46:26 +0800
Message-Id: <20240805-potin-catalina-dts-v7-0-286bfd2ab93b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLzsGYC/4XOy2rDQAwF0F8Js+6UseaZrPofpQvNKxEkdvAY0
 xL871WyaWpMu7xC90g30cpIpYnD7ibGMlOjoefgX3YinbA/FkmZswAFRnkw8jpM1MuEE56pR5m
 nJmvGrqCGvY+d4OJ1LJU+H+j7B+cTtWkYvx43ZrhP/+RmkEpGDNl4m3hLvx0vSOfXNFzEnZv1M
 2E3Cc2ERhtt3heXY1oT5n/CMIHoKmiLUHxYE/aZcJuEZSJUBVpZrBb8mnA/RFCwSTgmVAzVdTE
 oF359sSzLNyViZwPAAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722872938; l=2314;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=3CsJgkR0mUZo4A/DQ7qYKhVfPLpEdxnVGjuyWySSv24=;
 b=hausdzOF2/7qQgGbyl3yV2SIasHUc/BC1QZewv+iiwnk3n6vIPa0TdfQkFWGU66hh7LGuWPwK
 eHwqG70SMmxD1ytwN016DVSlkDhZ4xDfcGEMEUtTSat5pc3tnOjIHXx
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
Changes in v7:
- drop 'pinctrl-names' in gpio0 node
- change 'vref' to 'vref-supply' in adc0 & adc1 nodes
- add p1v8_bmc_aux & p2v5_bmc_aux nodes
- change Signed-off tag email as same as sender.
- Link to v6: https://lore.kernel.org/r/20240802-potin-catalina-dts-v6-0-0b8f61b80688@gmail.com

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
 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 979 +++++++++++++++++++++
 3 files changed, 981 insertions(+)
---
base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
change-id: 20240724-potin-catalina-dts-fda1ea3297b1

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

