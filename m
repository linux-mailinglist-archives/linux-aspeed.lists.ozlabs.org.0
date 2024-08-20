Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F8957935
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:57:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqJ36Vy3z3vXp
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:35 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=txjeDK0+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+forbidden405.outlook.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlYjm4hfVz3c9N;
	Thu, 29 Feb 2024 12:37:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 265FC619BA;
	Thu, 29 Feb 2024 01:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5E50C433C7;
	Thu, 29 Feb 2024 01:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709170616;
	bh=DbESgbLm8iXZ1xAIRzvPJVCUiiqIdNKZWaT+1vVOvZ0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=txjeDK0+8//21KLVNW5XiKexTTpb8rf/pX9PHaEyX2JsA0MpqAvGt/cmD/87zCcKa
	 n7UeeNR0K3BbMJslRkxAcV4Ga9jiX3vS5/iPTkMXvvZMyBHZpeUbiSkecumViBLSv+
	 4AmADfW6qYbF9KEaNZ03vs0jwIbmocoZN2SwxqxOlzs9JlTSKkBVdoFZx2jol8GBUy
	 IAWRUeOg9oASxvm+e3OgKY0vWWQN0glQRTwVA8mD3Y5qp5KV1pxhlessNq2slppbkj
	 VSU8JFzVs82UPdeJ1A55MeEj5Oq+32lD6Z8uyZfww1Cm+uV98Q/JQCR7QxA/1QemjJ
	 bohqSH5IgfHyg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96B2CC5475B;
	Thu, 29 Feb 2024 01:36:56 +0000 (UTC)
From: Yang Xiwen via B4 Relay <devnull+forbidden405.outlook.com@kernel.org>
Subject: [PATCH v7 0/5] mmc: add hi3798mv200 specific extensions of DWMMC
Date: Thu, 29 Feb 2024 09:36:18 +0800
Message-Id: <20240229-b4-mmc-hi3798mv200-v7-0-10c03f316285@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJLf32UC/4XRS07EMAwG4KuMsiYodhynZcU9EIs2DxpBJ6gdI
 tCodycdNkWtNMvfkj/b8lXMYUphFk+nq5hCSXPK5xrsw0m4oTu/BZl8zQIVkgIE2ZMcRyeHpG3
 bjAWVkp2xWgUfAdGJ2vg5hZi+b+jLa81Dmi95+rnNKLBW/zgEPuIKSCWtJ/Z9Q6YL/Jy/Lh85v
 z+6PIoVLHgfwYooUJ514A682SN6i9hDRFckgiEmsNyS3SN0H6F1k+h923tqjMY9YjYIqkPErJs
 Yxc6Y2ATSe4S3yOGfClekdwR95K6tB/1HlmX5BeEHM1kPAgAA
To: Ulf Hansson <ulf.hansson@linaro.org>, 
 Jaehoon Chung <jh80.chung@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709170614; l=3128;
 i=forbidden405@outlook.com; s=20240228; h=from:subject:message-id;
 bh=DbESgbLm8iXZ1xAIRzvPJVCUiiqIdNKZWaT+1vVOvZ0=;
 b=lqJUGZQRau+vHK8zzfG0TQhZLe44ISqDiBVhDKit2Z7lPJv2XYc1hzqzRZs3Sl3dKFjfCV0AH
 GbgNgWa0197D8TwR67DQTdMBcMSbYcKtgLGGRTvSOOwNH86bhNe27/E
X-Developer-Key: i=forbidden405@outlook.com; a=ed25519;
 pk=KAWv6ZzFsT54MGllOczJgFiWB+DuayEmyn24iiVVThU=
X-Endpoint-Received:  by B4 Relay for forbidden405@outlook.com/20240228 with auth_id=136
X-Original-From: Yang Xiwen <forbidden405@outlook.com>
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Reply-To: forbidden405@outlook.com
Cc: devicetree@vger.kernel.org, tianshuliang <tianshuliang@hisilicon.com>, linux-aspeed@lists.ozlabs.org, Paul Menzel <pmenzel@molgen.mpg.de>, Igor Opaniuk <igor.opaniuk@linaro.org>, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, Yang Xiwen <forbidden405@outlook.com>, David Yang <mmyangfl@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

it's modified from hi3798cv200 driver, but quite a lot of code gets
rewritten because of the hardware differences. Actually cv200 DWMMC core
is called HIMCIV200 while mv200 DWMMC core is called HIMCIV300 in
downstream.

Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
---
Changes in v7:
- driver: simplify tuning logic (Ulf Hansson)
- bindings: fix patch order (Ulf Hansson)
- Link to v6: https://lore.kernel.org/r/20240221-b4-mmc-hi3798mv200-v6-0-bc41bf6a9769@outlook.com

Changes in v6:
- apply the comments to the first patch, add their trailers
- Link to v5: https://lore.kernel.org/r/20240220-b4-mmc-hi3798mv200-v5-0-f506c55f8e43@outlook.com

Changes in v5:
- pick the dependant patch: https://lore.kernel.org/all/20240215-mmc_phase-v1-1-f27644ee13e4@outlook.com/
  to fix the bot build error.
- edit the semantic meaning of hisilicon,sap-dll-reg property (Rob Herring)
  The suggestion is from the CRG driver side:
  https://lore.kernel.org/all/20240218205741.GA1561527-robh@kernel.org/
- Link to v4: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v4-0-0fdd9bd48532@outlook.com

Changes in v4:
- rename dw_mmc-hi3798 back to hi3798cv200 - Suggested by Krzysztof Kozlowski.
- add r-bs to patch 1 and 2 - Reviewed by Krzysztof Kozlowski.
- Link to v3: https://lore.kernel.org/r/20240217-b4-mmc-hi3798mv200-v3-0-f15464176947@outlook.com

Changes in v3:
- dw_mmc-hi3798: fix bot error (Rob Herring)
- Link to v2: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v2-0-010d63e6a1d5@outlook.com

Changes in v2:
- dw_mmc-hi3798mv200: use dev_err_probe() helper - Suggested by Krzysztof Kozlowski.
- dw_mmc-hi3798mv200: add missing err=0;
- dw_mmc-hi3798c(m)v200: remove unused MODULE_ALIAS() - Suggested by Krzysztof Kozlowski.
- binding: rename the binding, a lot of tweaks suggested by Krzysztof Kozlowski.
- Link to v1: https://lore.kernel.org/r/20240216-b4-mmc-hi3798mv200-v1-0-7d46db845ae6@outlook.com

---
Yang Xiwen (5):
      mmc: host: mmc_of_parse_clk_phase(): Pass struct device * instead of mmc_host *
      mmc: dw_mmc-hi3798cv200: remove MODULE_ALIAS()
      dt-bindings: mmc: dw-mshc-hi3798cv200: convert to YAML
      dt-bindings: mmc: hisilicon,hi3798cv200-dw-mshc: add Hi3798MV200 binding
      mmc: dw_mmc: add support for hi3798mv200

 .../bindings/mmc/hi3798cv200-dw-mshc.txt           |  40 ----
 .../mmc/hisilicon,hi3798cv200-dw-mshc.yaml         |  97 ++++++++
 drivers/mmc/core/host.c                            |   4 +-
 drivers/mmc/host/Kconfig                           |   9 +
 drivers/mmc/host/Makefile                          |   1 +
 drivers/mmc/host/dw_mmc-hi3798cv200.c              |   1 -
 drivers/mmc/host/dw_mmc-hi3798mv200.c              | 251 +++++++++++++++++++++
 drivers/mmc/host/sdhci-of-aspeed.c                 |   2 +-
 include/linux/mmc/host.h                           |   2 +-
 9 files changed, 361 insertions(+), 46 deletions(-)
---
base-commit: d206a76d7d2726f3b096037f2079ce0bd3ba329b
change-id: 20240121-b4-mmc-hi3798mv200-a5730edf122c

Best regards,
-- 
Yang Xiwen <forbidden405@outlook.com>

