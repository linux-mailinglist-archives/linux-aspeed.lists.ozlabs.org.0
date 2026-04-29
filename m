Return-Path: <linux-aspeed+bounces-3982-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAtpO/xH8mm1pQEAu9opvQ
	(envelope-from <linux-aspeed+bounces-3982-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Apr 2026 20:03:40 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD44498878
	for <lists+linux-aspeed@lfdr.de>; Wed, 29 Apr 2026 20:03:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4g5QCZ08HZz2ykf;
	Thu, 30 Apr 2026 04:03:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1777485817;
	cv=none; b=V5wmX2OVMMHSAaVVcLOozvrOMy7hy8i10qGO0MMsNhgLV4H+OqAkqnF/BcHh4RpHOo6CPn9y5vRsL/8ClypbkHnreo6sfNbLpb6J6y3hLbVvaMFZgUShXBam3zW18e8HJid6cKwoXEjNZM/wdVmPFgzyo7ezI+C40uYG3dnE9lLjRUUPjvU95sQvCtqTCqT1xQl6Q1axs7p3ZxbPSEIVlt8kG2rxG3K7VqLhoBZm0J5kwsqqTnIulqhF0ir8KLmny54t4lWVLh4F13Y2G+naC9f8WVN/xj3XSvJKpqPWSL5wmQsCkhRPx5Ggk6BYGJxd5MqmHshQvz+5dx61ArJSoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1777485817; c=relaxed/relaxed;
	bh=5kdA1IC/RYXviplmXjfBx2K4qGRHF5L/z4JMU8G7heo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JT0I+jSIhgILMAN9g4EksYm17mkNFpFBmxb/1LSi4qxrF4PJMbmRLeHe9HNNKdpiO5RopK0tfSbSx1tzprpmUizTu/VcTIEBOjC9BYqfYW+ZT4GoS2iZfjpmBkci81o8x5xX2uktxFnHqDTH6ZAVxE0vN1wVA5aRSUIyXWaGTRfWYZd/3HuJ311ELMHhfp3fqaP5qMvHTipU4/8RA1Qa+ZOdd28QE612VbMseHOmoxEAUk2AuYFR2ErnC/s6WZmbgZFrMLkRD9SRrM1IKeTkHeQO1Kuyh/Joy/MN67f4dbikooZorvvwt6ewvyISaI/ZhL85k3XeNTuijjUK4af9Kw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ufpsxmOn; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ufpsxmOn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=miquel.raynal@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 341 seconds by postgrey-1.37 at boromir; Thu, 30 Apr 2026 04:03:35 AEST
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4g5QCW1kBtz2yjp
	for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Apr 2026 04:03:34 +1000 (AEST)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C3C8DC5CD61;
	Wed, 29 Apr 2026 17:58:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FE375FD43;
	Wed, 29 Apr 2026 17:58:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6862E1072B175;
	Wed, 29 Apr 2026 19:57:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777485478; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5kdA1IC/RYXviplmXjfBx2K4qGRHF5L/z4JMU8G7heo=;
	b=ufpsxmOnbM4aWlTqONbvM/hU0uS6dcXEqlxSHSr1HWYBIfGT90YPkgaK0cuFSbVDO2ePk8
	pWi3bwyR8ypZOab+t1cJA74MjXfz7fLvozJ6V7qmbhj3f34ty/OOJYwRbTAzFsAix386Ly
	D1FsPPSsy7tCoNaMLBxBDPlrFb/XK+/uCgMaGjsQ2R+B/RuAlAGmsUx5DuKH7qOrDHX7rD
	xayotK3EyInONV8I9cHKvaHPdCz3+n8OX+quL0wUzfkGZxlSYM7f+O8L+6M140LefKPS6/
	+pSdGDvUfdVqb0jYh6gv0v4c1CPJTYtO1hzRdfUdURt2Ao08UPOejiDAM7KKqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 29 Apr 2026 19:56:43 +0200
Subject: [PATCH v3 06/11] mtd: spinand: Use secondary ops for continuous
 reads
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-winbond-v6-18-rc1-cont-read-v3-6-0f38b3c229ad@bootlin.com>
References: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
In-Reply-To: <20260429-winbond-v6-18-rc1-cont-read-v3-0-0f38b3c229ad@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, 
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
 linux-stm32@st-md-mailman.stormreply.com
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1BD44498878
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3982-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nod.at,ti.com,bootlin.com,infineon.com,airoha.com,aspeedtech.com,kaod.org,jms.id.au,codeconstruct.com.au,gmail.com,google.com,foss.st.com,gmx.net];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:richard@nod.at,m:vigneshr@ti.com,m:mwalle@kernel.org,m:miquel.raynal@bootlin.com,m:takahiro.kuwano@infineon.com,m:lorenzo@kernel.org,m:ray.liu@airoha.com,m:chin-ting_kuo@aspeedtech.com,m:clg@kaod.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:avifishman70@gmail.com,m:tmaimon77@gmail.com,m:tali.perry1@gmail.com,m:venture@google.com,m:yuenn@google.com,m:benjaminfair@google.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:j.neuschaefer@gmx.net,m:pratyush@kernel.org,m:thomas.petazzoni@bootlin.com,m:STLin2@winbond.com,m:s-k6@ti.com,m:linux-spi@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:taliperry1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.968];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:dkim,bootlin.com:mid]

In case a chip supports continuous reads, but uses a slightly different
cache operation for these, it may provide a secondary operation template
which will be used only during continuous cache read operations.

From a vendor driver point of view, enabling this feature implies
providing a new set of templates for these continuous read
operations. The core will automatically pick the fastest variant,
depending on the hardware capabilities.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 61 ++++++++++++++++++++++++++++++++++++++++++++-
 include/linux/mtd/spinand.h | 12 +++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index a66510747b31..45c3afb9cceb 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -489,6 +489,11 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 
 	rdesc = spinand->dirmaps[req->pos.plane].rdesc;
 
+	if (spinand->op_templates->cont_read_cache && req->continuous)
+		rdesc->info.op_tmpl = &rdesc->info.secondary_op_tmpl;
+	else
+		rdesc->info.op_tmpl = &rdesc->info.primary_op_tmpl;
+
 	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED &&
 	    req->mode != MTD_OPS_RAW)
 		rdesc->info.op_tmpl->data.ecc = true;
@@ -1221,6 +1226,7 @@ static struct spi_mem_dirmap_desc *spinand_create_rdesc(
 		 * its spi controller, use regular reading
 		 */
 		spinand->cont_read_possible = false;
+		memset(&info->secondary_op_tmpl, 0, sizeof(info->secondary_op_tmpl));
 
 		info->length = nanddev_page_size(nand) +
 			       nanddev_per_page_oobsize(nand);
@@ -1237,11 +1243,24 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	struct nand_device *nand = spinand_to_nand(spinand);
 	struct spi_mem_dirmap_info info = { 0 };
 	struct spi_mem_dirmap_desc *desc;
-	bool enable_ecc = false;
+	bool enable_ecc = false, secondary_op = false;
 
 	if (nand->ecc.engine->integration == NAND_ECC_ENGINE_INTEGRATION_PIPELINED)
 		enable_ecc = true;
 
+	if (spinand->cont_read_possible && spinand->op_templates->cont_read_cache)
+		secondary_op = true;
+
+	/*
+	 * Continuous read implies that only the main data is retrieved, backed
+	 * by an on-die ECC engine. It is not possible to use a pipelind ECC
+	 * engine with continuous read.
+	 */
+	if (enable_ecc && secondary_op) {
+		secondary_op = false;
+		spinand->cont_read_possible = false;
+	}
+
 	/* The plane number is passed in MSB just above the column address */
 	info.offset = plane << fls(nand->memorg.pagesize);
 
@@ -1259,6 +1278,10 @@ static int spinand_create_dirmap(struct spinand_device *spinand,
 	/* Read descriptor */
 	info.primary_op_tmpl = *spinand->op_templates->read_cache;
 	info.primary_op_tmpl.data.ecc = enable_ecc;
+	if (secondary_op) {
+		info.secondary_op_tmpl = *spinand->op_templates->cont_read_cache;
+		info.secondary_op_tmpl.data.ecc = enable_ecc;
+	}
 	desc = spinand_create_rdesc(spinand, &info);
 	if (IS_ERR(desc))
 		return PTR_ERR(desc);
@@ -1607,6 +1630,33 @@ int spinand_match_and_init(struct spinand_device *spinand,
 		if (ret)
 			return ret;
 
+		if (info->op_variants.cont_read_cache) {
+			op = spinand_select_op_variant(spinand, SSDR,
+						       info->op_variants.cont_read_cache);
+			if (op) {
+				const struct spi_mem_op *read_op;
+
+				read_op = spinand->ssdr_op_templates.read_cache;
+
+				/*
+				 * Sometimes the fastest continuous read variant may not
+				 * be supported. In this case, prefer to use the fastest
+				 * read from cache variant and disable continuous reads.
+				 */
+				if (read_op->cmd.buswidth > op->cmd.buswidth ||
+				    (read_op->cmd.dtr && !op->cmd.dtr) ||
+				    read_op->addr.buswidth > op->addr.buswidth ||
+				    (read_op->addr.dtr && !op->addr.dtr) ||
+				    read_op->data.buswidth > op->data.buswidth ||
+				    (read_op->data.dtr && !op->data.dtr))
+					spinand->cont_read_possible = false;
+				else
+					spinand->ssdr_op_templates.cont_read_cache = op;
+			} else {
+				spinand->cont_read_possible = false;
+			}
+		}
+
 		/* I/O variants selection with octo-spi DDR commands (optional) */
 
 		ret = spinand_init_odtr_instruction_set(spinand);
@@ -1629,6 +1679,15 @@ int spinand_match_and_init(struct spinand_device *spinand,
 					       info->op_variants.update_cache);
 		spinand->odtr_op_templates.update_cache = op;
 
+		if (info->op_variants.cont_read_cache) {
+			op = spinand_select_op_variant(spinand, ODTR,
+						       info->op_variants.cont_read_cache);
+			if (op)
+				spinand->odtr_op_templates.cont_read_cache = op;
+			else
+				spinand->cont_read_possible = false;
+		}
+
 		return 0;
 	}
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 896e9b5de0c4..4ff3f3383d46 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -576,6 +576,7 @@ enum spinand_bus_interface {
  * @op_variants.read_cache: variants of the read-cache operation
  * @op_variants.write_cache: variants of the write-cache operation
  * @op_variants.update_cache: variants of the update-cache operation
+ * @op_variants.cont_read_cache: variants of the continuous read-cache operation
  * @vendor_ops: vendor specific operations
  * @select_target: function used to select a target/die. Required only for
  *		   multi-die chips
@@ -600,6 +601,7 @@ struct spinand_info {
 		const struct spinand_op_variants *read_cache;
 		const struct spinand_op_variants *write_cache;
 		const struct spinand_op_variants *update_cache;
+		const struct spinand_op_variants *cont_read_cache;
 	} op_variants;
 	const struct spinand_op_variants *vendor_ops;
 	int (*select_target)(struct spinand_device *spinand,
@@ -629,6 +631,14 @@ struct spinand_info {
 		.update_cache = __update,				\
 	}
 
+#define SPINAND_INFO_OP_VARIANTS_WITH_CONT(__read, __write, __update, __cont_read) \
+	{								\
+		.read_cache = __read,					\
+		.write_cache = __write,					\
+		.update_cache = __update,				\
+		.cont_read_cache = __cont_read,				\
+	}
+
 #define SPINAND_INFO_VENDOR_OPS(__ops)					\
 	.vendor_ops = __ops
 
@@ -700,6 +710,7 @@ struct spinand_dirmap {
  * @read_cache: read cache op template
  * @write_cache: write cache op template
  * @update_cache: update cache op template
+ * @cont_read_cache: continuous read cache op template (optional)
  */
 struct spinand_mem_ops {
 	struct spi_mem_op reset;
@@ -714,6 +725,7 @@ struct spinand_mem_ops {
 	const struct spi_mem_op *read_cache;
 	const struct spi_mem_op *write_cache;
 	const struct spi_mem_op *update_cache;
+	const struct spi_mem_op *cont_read_cache;
 };
 
 /**

-- 
2.53.0


