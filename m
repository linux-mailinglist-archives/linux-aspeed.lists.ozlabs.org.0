Return-Path: <linux-aspeed+bounces-286-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB8729FC099
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Dec 2024 18:07:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHhCd4pHFz2xfb;
	Wed, 25 Dec 2024 04:07:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.194
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735060061;
	cv=none; b=Pom+Wc01WJctX322Tk1H5I3yD70KY408CvZtL5/V8D9ipBFfZ9d/0/9JKm1gkZcSWoOyBp0CnkYjRA6HEMnSdIEgAneHoTUyvBcwxtfGWNVUDBrMyP93JXYhaLALQa9515Bk6rrN3XmDcljIE8B5cXlkeiOD7EZILM0c8bcM+Ax4AXIJ5V8a16RndVTucIs4tnurEnr/Vbs6Ogn5YO8E1dSEoMxII/Saf0IgBq9tL5AF/xaG55VzpnlWOS478ucQuVgMNNXKYCNf/POl7DT2Ugspp74qNSPd3KnJ7A02RwT0Ia7m4nh5DLK30eh7q7OlQJkVdaLGc2V75YbBKDLSTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735060061; c=relaxed/relaxed;
	bh=Dlkm5iEGnjrM/0g/DWcfF67rhxN4oprE30zNEwCGgo0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Odgv3e/Zi3W8C5Md5Eff1LzxIOg+6He3wd0VV10uRLWukfRa1fzm/zWd/MmEoqT4jLQOj5Fwu2FhCCetRekn5E5hLPVxSeMzBjDFFJg0deW2lHlqZg2OF4bP8cHRTc7D/XRQmwft+2urhin4nzuhYmynsvqLESr45SxWFl6P9/bvrtr+tF568AP/UnlhKOvQFqh+jo7VJeRjKl/rj9zCgtMM5ce4CqARgONfoq6dZXqVRJni+BfNdSxrRlo82Td1CQvEJsZTx8QOxv1/bmTNXBAARZYKi8dmRpFPT6IR61HAyUnNBuIJVA2SZMN8UbVmn02ZL7I8H5ex29eMJC+/ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DYX7H+op; dkim-atps=neutral; spf=pass (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=DYX7H+op;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHhCc1Qddz2ysX;
	Wed, 25 Dec 2024 04:07:39 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9B5DC40004;
	Tue, 24 Dec 2024 17:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735060054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dlkm5iEGnjrM/0g/DWcfF67rhxN4oprE30zNEwCGgo0=;
	b=DYX7H+opRaGC9vHfQchChEJj2F8PQOQdXIHRPK9bAOM+u/ERMSIVBuyKyi7AWeAjlJ7rHn
	kdRcyZ2B52m5tEQnLPgXhTDFxP+sfKXOUkSSpBYnBaYf5N2R0ppYswTQtcAkzqiYyj8Kwf
	ycDSoKLOuZ7fwI4eCn351YiEe4+b/unBiog0OZhgh6EnsqB0OrZdNP4XSm1FWprx+uGIVJ
	m/49JVxPD0jC1QD1GS4mbPFJLGxeYq+sMoO8pyIZWDRpb/76W2GKA6X/KMj2pVMXHRvB3n
	e7W/cA4MNxJvBa0gXhGmTTRntEE2hjbM6aZiLYfdAz08IAc6CtzcEPLRKpZJeQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 18:06:00 +0100
Subject: [PATCH v2 15/27] spi: spi-ti-qspi: Support per spi-mem operation
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
Message-Id: <20241224-winbond-6-11-rc1-quad-support-v2-15-ad218dbc406f@bootlin.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Every ->exec_op() call correctly configures the spi bus speed to the
maximum allowed frequency for the memory using the constant spi default
parameter. Since we can now have per-operation constraints, let's use
the value that comes from the spi-mem operation structure instead. In
case there is no specific limitation for this operation, the default spi
device value will be given anyway.

The per-operation frequency capability is thus advertised to the spi-mem
core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ti-qspi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
index 9122350402b5062dfc8bcf70ac47ba51fad64b3e..49516fee74b0f2062c43d714fcb97c7a55580b37 100644
--- a/drivers/spi/spi-ti-qspi.c
+++ b/drivers/spi/spi-ti-qspi.c
@@ -623,7 +623,7 @@ static int ti_qspi_exec_mem_op(struct spi_mem *mem,
 	mutex_lock(&qspi->list_lock);
 
 	if (!qspi->mmap_enabled || qspi->current_cs != spi_get_chipselect(mem->spi, 0)) {
-		ti_qspi_setup_clk(qspi, mem->spi->max_speed_hz);
+		ti_qspi_setup_clk(qspi, op->max_freq);
 		ti_qspi_enable_memory_map(mem->spi);
 	}
 	ti_qspi_setup_mmap_read(mem->spi, op->cmd.opcode, op->data.buswidth,
@@ -658,6 +658,10 @@ static const struct spi_controller_mem_ops ti_qspi_mem_ops = {
 	.adjust_op_size = ti_qspi_adjust_op_size,
 };
 
+static const struct spi_controller_mem_caps ti_qspi_mem_caps = {
+	.per_op_freq = true,
+};
+
 static int ti_qspi_start_transfer_one(struct spi_controller *host,
 		struct spi_message *m)
 {
@@ -777,6 +781,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
 	host->bits_per_word_mask = SPI_BPW_MASK(32) | SPI_BPW_MASK(16) |
 				   SPI_BPW_MASK(8);
 	host->mem_ops = &ti_qspi_mem_ops;
+	host->mem_caps = &ti_qspi_mem_caps;
 
 	if (!of_property_read_u32(np, "num-cs", &num_cs))
 		host->num_chipselect = num_cs;

-- 
2.47.0


