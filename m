Return-Path: <linux-aspeed+bounces-287-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D0C9FC09B
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Dec 2024 18:07:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHhCg1hF2z2yVd;
	Wed, 25 Dec 2024 04:07:43 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::222"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735060063;
	cv=none; b=n/qRmgXXihk2HrHmnzvqK3rAMnkT1Rh1RVnjQ905/ntRC4hxuXniJ04eAZ/2jCArCeFWG/Bq6LUkVDXne/fpt6ZlaxxpkTwOzGAwXjgDI0CJ82n2a2rhWJbuypqU73wIPXov1ViYiUTeBwzMTjjRfnNbwd62OENSnQxzbYroc7MYczdNVUZLrlWeHSucMbYaDrER2H+7JmSYotNwui2eHdGp/GMvZcpSzk+s43ZqhkpMWr/ZIQpuZHBAPGKpsjnGIaRXfAexKqmIJw10X1zEYJsAR8KhpQBjkKow9vm9ptzyYVqdLarTzuBK7Pi8uqIuz9tPlzh98UaLMpj+S2vGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735060063; c=relaxed/relaxed;
	bh=nrGU5YmafXBcwzax7Dz7/fkc5aKf/Lo+6Qt8hqq78ww=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WhTaBqrdB0/30+j9s7cz0NCi+JWYalMAVpMT6b2UErdBCMOXWbMet3BFVsjr9fISYl1CoU2Zm9lkaEUJFsDzzavKRNUhKfMd88hXD/OsiOWnEd7Al7v+u3YgHDZBp/CLazKYri5cDIB/okGld6yjg64L/nqsvr+RkHulur+VR6tWXacYAoLmPk098s5gOLcpNa1qhzJfrLgDeQMbRtN9spC4dtjE6WqlU/Otr2EKq817zKu2P3TNPG+GcQc4DFPgAcwXXFAgqYydre/LCN/dmr6AfNkuKpTFXl6ibBxmMKvW9q3cbHZ+OmBP3efBix2RT79Lnhc1pNmsf+06PTTRTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=o9cmLlei; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=o9cmLlei;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Wed, 25 Dec 2024 04:07:41 AEDT
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHhCd2CJHz2xjd;
	Wed, 25 Dec 2024 04:07:41 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4653940002;
	Tue, 24 Dec 2024 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrGU5YmafXBcwzax7Dz7/fkc5aKf/Lo+6Qt8hqq78ww=;
	b=o9cmLlei4SVjACmnx8b9OR17EDa9MM8UqcY95EsA75X6fF5V55vjDRjx6S/m4N5rv61PMV
	Qg9pjzjzdnmwCj+bdQwuOGNte7wETrmUz1JOty5bUgGke0N/UaoI5+vkTHK8LVw1T1IVuz
	PQ1Zkmxrnc+Bmwr1g9lLsFzQ8jojwMNwizGoU1g/UAmb4oCUUwbk8++N6d5oGjFLJWrcEn
	3HnOM41v0tL1h/opiKnYgNKlhdAHzmF8LniGkL7z0LekHLcYNF6+PTROTXb8l2HMCujaZC
	EnuGOoTh4fSBqmWqCn4QNi5iGH2SEtsVBQfOy0yAAO0hOu7vW8682g/tQCB+ig==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:06:01 +0100
Subject: [PATCH v2 16/27] spi: zynq-qspi: Support per spi-mem operation
 frequency switches
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-16-ad218dbc406f@bootlin.com>
References: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
In-Reply-To: <20241224-winbond-6-11-rc1-quad-support-v2-0-ad218dbc406f@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Sanjay R Mehta <sanju.mehta@amd.com>, 
 Serge Semin <fancer.lancer@gmail.com>, Han Xu <han.xu@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Haibo Chen <haibo.chen@nxp.com>, Yogesh Gaur <yogeshgaur.83@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Raju Rangoju <Raju.Rangoju@amd.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <stlin2@winbond.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-mtd@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-zynq-qspi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index dee9c339a35e74c86fe1c768990a3f870b0a1b9d..f3cacb01e25b97892f9fbefc6e5cf43b9722ae4d 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -318,6 +318,7 @@ static void zynq_qspi_chipselect(struct spi_device *spi, bool assert)
  * zynq_qspi_config_op - Configure QSPI controller for specified transfer
  * @xqspi:	Pointer to the zynq_qspi structure
  * @spi:	Pointer to the spi_device structure
+ * @op:		The memory operation to execute
  *
  * Sets the operational mode of QSPI controller for the next QSPI transfer and
  * sets the requested clock frequency.
@@ -331,7 +332,8 @@ static void zynq_qspi_chipselect(struct spi_device *spi, bool assert)
  * controller the driver will set the highest or lowest frequency supported by
  * controller.
  */
-static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi)
+static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi,
+			       const struct spi_mem_op *op)
 {
 	u32 config_reg, baud_rate_val = 0;
 
@@ -346,7 +348,7 @@ static int zynq_qspi_config_op(struct zynq_qspi *xqspi, struct spi_device *spi)
 	 */
 	while ((baud_rate_val < ZYNQ_QSPI_CONFIG_BAUD_DIV_MAX)  &&
 	       (clk_get_rate(xqspi->refclk) / (2 << baud_rate_val)) >
-		spi->max_speed_hz)
+		op->max_freq)
 		baud_rate_val++;
 
 	config_reg = zynq_qspi_read(xqspi, ZYNQ_QSPI_CONFIG_OFFSET);
@@ -534,7 +536,7 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 		op->dummy.buswidth, op->data.buswidth);
 
 	zynq_qspi_chipselect(mem->spi, true);
-	zynq_qspi_config_op(xqspi, mem->spi);
+	zynq_qspi_config_op(xqspi, mem->spi, op);
 
 	if (op->cmd.opcode) {
 		reinit_completion(&xqspi->data_completion);
@@ -620,6 +622,10 @@ static const struct spi_controller_mem_ops zynq_qspi_mem_ops = {
 	.exec_op = zynq_qspi_exec_mem_op,
 };
 
+static const struct spi_controller_mem_caps zynq_qspi_mem_caps = {
+	.per_op_freq = true,
+};
+
 /**
  * zynq_qspi_probe - Probe method for the QSPI driver
  * @pdev:	Pointer to the platform_device structure
@@ -706,6 +712,7 @@ static int zynq_qspi_probe(struct platform_device *pdev)
 	ctlr->mode_bits =  SPI_RX_DUAL | SPI_RX_QUAD |
 			    SPI_TX_DUAL | SPI_TX_QUAD;
 	ctlr->mem_ops = &zynq_qspi_mem_ops;
+	ctlr->mem_caps = &zynq_qspi_mem_caps;
 	ctlr->setup = zynq_qspi_setup_op;
 	ctlr->max_speed_hz = clk_get_rate(xqspi->refclk) / 2;
 	ctlr->dev.of_node = np;

-- 
2.47.0


