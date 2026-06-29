Return-Path: <linux-aspeed+bounces-4319-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 22LGBx4GQ2paNAoAu9opvQ
	(envelope-from <linux-aspeed+bounces-4319-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jun 2026 01:56:14 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D146DF4B3
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jun 2026 01:56:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="HgMltV/i";
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4319-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4319-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gq3874x4bz2yRn;
	Tue, 30 Jun 2026 09:56:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782715777;
	cv=none; b=Zkef9xu+bOKo1tm7rUMVC6KHOudaUfSXfhvHM4t+0v1M2WMdYFCEdliROq/ZfwSn40oednBDcSs8D5vg1b/gi3jLxaO2vQXeNWTVm20CKahDxns+b6Y+fz/VatqGB/NFgr14cfLyhZrT/W6UqhD6DeIW7roAejWmWO5HP3Rupa3ecCRo3YFz5ik2Nia+NhlV0LevGE77rylTBZEf4U6i+EqJ5Ois31gKM56/5bBwrEQGMox/KAQwhuAxb2JaW9X4fLstnUccUJywI/0LBEZAKANdD1e6ZEkN0f3KbvQIEYWYk15KVXEKSv9f88T5xDxLweNaCNN8NoBZEWD9VfDAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782715777; c=relaxed/relaxed;
	bh=eDudAM8QJ8mlGZ+xLz/u0jrk7EBH14j1ZjojnoRSWmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NCAl2MAkrzFmmQ7icWfAbnG+kSmHmwoJAdh1tWReySFCpFGV3nKnQo1iZ6Rgp+SClpq3UegedE9eLFpvM/c9IfqCyL51jISWXVkVA0jDWZ+qh06QvEM+/TPmFd4LQ+1ETO1Q33Nq6rIQ8WCGf0p4eS2WcTsLlqPhCHvDt4swttOa+m3KVI7PoGWk8zL558Ob7TC6F5knMOpgOLrRc8FXlFBsv3tBHsRmKQWdXZzrOCRudjNFUF7JZlURQsr3pYyFfqtHVNCMMPH2haoN1eN3OWfXdOA0ENdrPE2/f+jE0bJuu9Hg17HR+RhxRex0rcUNM1A4kbE/895E/rrNQzXJ8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HgMltV/i; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+yc_hsieh.aspeedtech.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gpcMh4mZdz2ydn
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jun 2026 16:49:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3782F43DA3;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A16BC2BCF7;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782715774;
	bh=0gtJ2jkDHDroFd/tvTFdjs9XdlK02tL9fNLXJCMYb4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HgMltV/iuPgeub48WZJi5UNGtHADF4P3curFF4GXLEnc5pjZNPEZz+2Epjdt1r+7L
	 qelftI3L2Khr/t3/49q9vmjRKEsYoFUWfN0BL6fK7xtDnt7jicE2eVjaQcU6wt9mFi
	 QynK3Z4NxV33wPDBA6V3PP2AIBCZg9cjIRz7zeENmfNTn6BScbTgNsLwoBbmAXfRHy
	 VBffFYCZiLixphDj2UQxzg8tXonddTlOLIGTxDU/s3o+Wq90vvdyJ6vmh+w7HnhnRd
	 2NVFPBb4kf47+mAVxCgEDHfQh4rnMjmUE9U9hmTCZ66r6DLWW90tdfFNoEB/kMv27E
	 CpC17bZKKRu6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12488C43327;
	Mon, 29 Jun 2026 06:49:34 +0000 (UTC)
From: Yu-Che Hsieh via B4 Relay <devnull+yc_hsieh.aspeedtech.com@kernel.org>
Date: Mon, 29 Jun 2026 14:49:01 +0800
Subject: [PATCH 4/4] ipmi: bt-bmc: Read LPC address and SerIRQ from device
 tree
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
Message-Id: <20260629-aspeed-bt-bmc-multichannel-v1-4-fc23ee337f7a@aspeedtech.com>
References: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
In-Reply-To: <20260629-aspeed-bt-bmc-multichannel-v1-0-fc23ee337f7a@aspeedtech.com>
To: Corey Minyard <corey@minyard.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: openipmi-developer@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782715772; l=2682;
 i=yc_hsieh@aspeedtech.com; s=20260629; h=from:subject:message-id;
 bh=EF1+2Ti2wuA06NwsW+QoJlNDr5W2qvG2AEgoxOs4li0=;
 b=D8mUNlVKBhK5Gu/mgQ8KRyUEN1CNPv03ZJ5EwBjb30X1V0G4Oa8eeCxz2irvaf9+E10wC+2xk
 NlEhO1Jg+MeC2Jw2RoKwDKxh0eDBGNOXrLMxbmHqBpwqDkiyalK4VAY
X-Developer-Key: i=yc_hsieh@aspeedtech.com; a=ed25519;
 pk=kLxUeF7g6teciq79it9N3tYNgp3yCspZ+AHlYSnZ0gs=
X-Endpoint-Received: by B4 Relay for yc_hsieh@aspeedtech.com/20260629 with
 auth_id=844
X-Original-From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Reply-To: yc_hsieh@aspeedtech.com
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4319-lists,linux-aspeed=lfdr.de,yc_hsieh.aspeedtech.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:corey@minyard.net,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:openipmi-developer@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:yc_hsieh@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-aspeed@lists.ozlabs.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	HAS_REPLYTO(0.00)[yc_hsieh@aspeedtech.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspeedtech.com:replyto,aspeedtech.com:email,aspeedtech.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29D146DF4B3

From: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>

The BT interface currently programs a fixed host LPC IO address and

SerIRQ number. This works for the existing single-channel setup, but

does not allow the host interface parameters to be described by firmware.

Read the LPC IO address from aspeed,lpc-io-reg and the SerIRQ number

and interrupt type from aspeed,lpc-interrupts. Keep the existing IO

address, SerIRQ number, and level-low interrupt type as defaults when

the properties are not present.

Signed-off-by: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
---
 drivers/char/ipmi/bt-bmc.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
index 486ecc0b6815..6e1f941e63db 100644
--- a/drivers/char/ipmi/bt-bmc.c
+++ b/drivers/char/ipmi/bt-bmc.c
@@ -65,6 +65,12 @@ struct bt_bmc {
 	struct timer_list	poll_timer;
 	struct mutex		mutex;
 	atomic_t		open_count;
+	u32			io_addr;
+
+	struct {
+		u32 id;
+		u32 type;
+	} sirq;
 };
 
 static u8 bt_inb(struct bt_bmc *bt_bmc, int reg)
@@ -429,6 +435,33 @@ static int bt_bmc_probe(struct platform_device *pdev)
 	mutex_init(&bt_bmc->mutex);
 	init_waitqueue_head(&bt_bmc->queue);
 
+	rc = of_property_read_u32(dev->of_node, "aspeed,lpc-io-reg",
+				  &bt_bmc->io_addr);
+	if (rc) {
+		bt_bmc->io_addr = BT_IO_BASE;
+	} else if (bt_bmc->io_addr > FIELD_MAX(BT_CR0_IO_BASE)) {
+		dev_err(dev, "invalid LPC IO address\n");
+		return -EINVAL;
+	}
+
+	rc = of_property_read_u32_array(dev->of_node, "aspeed,lpc-interrupts",
+					(u32 *)&bt_bmc->sirq, 2);
+	if (rc) {
+		bt_bmc->sirq.id = BT_IRQ;
+		bt_bmc->sirq.type = IRQ_TYPE_LEVEL_LOW;
+	} else {
+		if (bt_bmc->sirq.id > FIELD_MAX(BT_CR0_SIRQ)) {
+			dev_err(dev, "invalid SerIRQ number\n");
+			return -EINVAL;
+		}
+
+		if (bt_bmc->sirq.type != IRQ_TYPE_LEVEL_HIGH &&
+		    bt_bmc->sirq.type != IRQ_TYPE_LEVEL_LOW) {
+			dev_err(dev, "invalid SerIRQ type\n");
+			return -EINVAL;
+		}
+	}
+
 	bt_bmc->miscdev.minor	= MISC_DYNAMIC_MINOR;
 	bt_bmc->miscdev.name	= DEVICE_NAME;
 	bt_bmc->miscdev.fops	= &bt_bmc_fops;
@@ -450,8 +483,10 @@ static int bt_bmc_probe(struct platform_device *pdev)
 		add_timer(&bt_bmc->poll_timer);
 	}
 
-	writel(FIELD_PREP(BT_CR0_IO_BASE, BT_IO_BASE) |
-	       FIELD_PREP(BT_CR0_SIRQ, BT_IRQ) |
+	writel(FIELD_PREP(BT_CR0_IO_BASE, bt_bmc->io_addr) |
+	       FIELD_PREP(BT_CR0_SIRQ, bt_bmc->sirq.id) |
+	       FIELD_PREP(BT_CR0_SIRQ_TYPE,
+			  bt_bmc->sirq.type == IRQ_TYPE_LEVEL_LOW ? 0 : 1) |
 	       BT_CR0_EN_CLR_SLV_RDP |
 	       BT_CR0_EN_CLR_SLV_WRP |
 	       BT_CR0_ENABLE_IBT,

-- 
2.34.1



