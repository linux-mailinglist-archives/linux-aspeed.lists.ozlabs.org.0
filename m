Return-Path: <linux-aspeed+bounces-4427-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IbEKL0IfTmqLDgIAu9opvQ
	(envelope-from <linux-aspeed+bounces-4427-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Jul 2026 11:58:26 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C51723F1C
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Jul 2026 11:58:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=h9aDP3qa;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4427-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4427-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gwD7L4Dsfz2xKh;
	Wed, 08 Jul 2026 19:58:22 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1783504702;
	cv=none; b=EkAWSLoWBybPMDnEJHPlFyscoo/GquX0Kqivxs0w08AKVNLrwvJI6shi93l1JLsfDhbzjZl2iWOZoF80GzOoU8gecYSywdJjkBVZrnt8ZKDupZhiJCm7QbIaxPYxtD0kQG6QeubPDC64Bm3C+TsNeZaJ9lXnV1MPa2yPtxo6ZB1Xe+TQ7tSnqLYzxnofzp6kfBKvRgeD9AoCB4gMdQ8CVOvwJfiwFucQhh6benzZzXGXpB0z+jVl6PADRhfRaJLOLs49nStsQiWtUuYhYYYR9SWPWIRVegPpYWwTLcfAMqITAMcceHNwDsllTJUVJmdv9liP+RvtWZKczMTZUrD6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1783504702; c=relaxed/relaxed;
	bh=RWwnnS6GeaolTc9bMDjJoioBxiXpdchd+xEqkloj854=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=asjNWIhiyq8ImMi2wJqKE3PaV3CEMoOF6IjM7tPSP/uESc/x7YH5YVEiw3ZJGvEEjRXpaI1jv39Gjl8LfNAlMvwQjh9mIXDqm9bcHaECDs06EiTQja2BeMILgGp0IRoqrNd+V8nRgyJrShywnSHb4JCygOnzuEzqZ+moeXYyTcen9NgVYMZEJAGj13zs4Cbrn7meEZWsJDqThJHCR59HpphwuGYWJn5DbK5VN8Ma8u2MMVORdpu7rHkUevHYpLRBKOv+NiFxvyHy7ryEWSI+7PZuzDRVQyR2MGpZNPSdv46uJ1v0EriVcfsFiKoN9jGW8PRol9eiJk6dS/fr2pMY6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h9aDP3qa; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gwD7K4T6qz2xC3
	for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Jul 2026 19:58:21 +1000 (AEST)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9529D40935;
	Wed,  8 Jul 2026 09:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 904611F000E9;
	Wed,  8 Jul 2026 09:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504698;
	bh=RWwnnS6GeaolTc9bMDjJoioBxiXpdchd+xEqkloj854=;
	h=From:To:Cc:Subject:Date;
	b=h9aDP3qaagnR2LQYiES34wpJhH6BpLm1rDyCK1/kU+o2iPw9xoXYUyWD1pDFq+hFF
	 DtP3VWpsBT5QZ0eKeqQrZaLFSNVu8NLdBH/mBGbTtQY7w1JpzsntHQgqvWdvq1Nkah
	 HrmXFkyXFKhOq5l4NDjtwnJY4GZ16QVa/V6ZIdGuhwvBWTYUWAryOxWNTjXn9CHuhm
	 glJA1Fxh0YtkK/2CIRZ1OAkMgCDiU55aIZAYwg+ybMF6i6nL+LFEf2TyHhp6+jUOqp
	 SqBOae0AQ3tbOuSP8XiPXSQNum4YRitjWC0Ssp2EBpKRxKVzZ2IFmm/86Y3wNNqQ5k
	 VWXQ3kjKC9n2A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: bhelgaas@google.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jacky Chou <jacky_chou@aspeedtech.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] PCI: aspeed: Switch to irq_domain_create_linear()
Date: Wed,  8 Jul 2026 11:58:14 +0200
Message-ID: <20260708095814.385480-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4427-lists,linux-aspeed=lfdr.de];
	FORGED_SENDER(0.00)[jirislaby@kernel.org,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:bhelgaas@google.com,m:linux-kernel@vger.kernel.org,m:jirislaby@kernel.org,m:tglx@kernel.org,m:jacky_chou@aspeedtech.com,m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-aspeed@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jirislaby@kernel.org,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jms.id.au:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F1C51723F1C

irq_domain_add_linear() is going away as being obsolete now. Switch to
the preferred irq_domain_create_linear(). That differs in the first
parameter: It takes more generic struct fwnode_handle instead of struct
device_node. Therefore, of_fwnode_handle() is added around the
parameter.

Note some of the users can likely use dev->fwnode directly instead of
indirect of_fwnode_handle(dev->of_node). But dev->fwnode is not
guaranteed to be set for all, so this has to be investigated on case to
case basis (by people who can actually test with the HW).

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>
---
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org
Cc: linux-pci@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/pci/controller/pcie-aspeed.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-aspeed.c b/drivers/pci/controller/pcie-aspeed.c
index 9aa9e14c6148..74b03a55643f 100644
--- a/drivers/pci/controller/pcie-aspeed.c
+++ b/drivers/pci/controller/pcie-aspeed.c
@@ -725,10 +725,10 @@ static int aspeed_pcie_init_irq_domain(struct aspeed_pcie *pcie)
 {
 	int ret;
 
-	pcie->intx_domain = irq_domain_add_linear(pcie->dev->of_node,
-						  PCI_NUM_INTX,
-						  &aspeed_intx_domain_ops,
-						  pcie);
+	pcie->intx_domain = irq_domain_create_linear(dev_fwnode(pcie->dev),
+						     PCI_NUM_INTX,
+						     &aspeed_intx_domain_ops,
+						     pcie);
 	if (!pcie->intx_domain) {
 		ret = dev_err_probe(pcie->dev, -ENOMEM,
 				    "failed to get INTx IRQ domain\n");
-- 
2.55.0


