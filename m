Return-Path: <linux-aspeed+bounces-4153-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIsTL3xNHWrDYgkAu9opvQ
	(envelope-from <linux-aspeed+bounces-4153-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 01 Jun 2026 11:14:36 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D05FA61C31E
	for <lists+linux-aspeed@lfdr.de>; Mon, 01 Jun 2026 11:14:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gTSvq5Jgfz2ydQ;
	Mon, 01 Jun 2026 19:14:31 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1780305271;
	cv=none; b=jgtt+DljLaUQ/QmWmnVl0Kr1PpdR72i42dJR7xcDQHrpVEN3QN7JRUdyA0wzlQxCroG8qI9ZlZgc/t7QczokPLVuVzaWWRHplqAPlatBMo9BR68hf1Y8xKRoyF1Eb7J0vARJCQB7Gf0/dUpR/1qYciVRXQsWcA+eYh8Tv8cjt0bygFNTJ9NmLYSx1eUwNKAZ+tVyUie6Opd3vYII1kOI3aXe891dDqx4cubOB47I51ts4dWSWKGIh9VU1h5EcOUG7AzO98YLTyYFn6VeqpsJXEgPq5yt+fkpRwG2E0S92yFp+jBl2vE8Q5NKYAQWjf0MN/myyXQPFVsCNPX/zOQFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1780305271; c=relaxed/relaxed;
	bh=FBm60XyCuDAzwDoDTQ9p1wR3+VSj0XoL0aTLqtE8uZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S6nnUwp9x/GMGNHjg25tNCWwlPX5aw7ead6uZWY1sQtuLo4Tmjp3sNOFpuYZqVaQCQA9Lu2hma1d8/UALfY4DngX1GvLhrLRtNyGel0/D4DrwbZ7PYQgPGpPIF9P7goijuNecrU/TfNuiDFZdAVeLsmIsikaTW2NWjy33X/FFLQ54eHYuiQFHb2RE6B6sST5Pey0K7H4mN0EK9Jwnxsw/MGU3gWz5/haVHdkBSR0Pc8ZqixAp2P4Z/2NadKPg3kvkUgg1voeC4a3aeYaI+MCrLb8LxOuMpWG+kRunhcmnVZf+Cnwwu66ObG3P8JSQR2ygO8//3pzZCV9LDfyGAbVxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeedtech.com; envelope-from=tommy_huang@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gTSvq07Zkz2xdb
	for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jun 2026 19:14:31 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Jun
 2026 17:14:10 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Jun 2026 17:14:10 +0800
From: Tommy Huang <tommy_huang@aspeedtech.com>
Date: Mon, 1 Jun 2026 17:14:07 +0800
Subject: [PATCH 2/2] rtc: aspeed: add AST2700 compatible
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
Message-ID: <20260601-ast2700-rtc-v1-2-15d4ca46500a@aspeedtech.com>
References: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
In-Reply-To: <20260601-ast2700-rtc-v1-0-15d4ca46500a@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, Tommy Huang <tommy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780305250; l=793;
 i=tommy_huang@aspeedtech.com; s=20260601; h=from:subject:message-id;
 bh=aHhrVFZ3S8/5xrq3jTdAdtMy/mbRjfnoMz8ic9XvQtQ=;
 b=3ClSMOEGtvnQTW0wY5ZFVHalJ0/8PbuusrkEJc6fZ/Hf8aoHJdmjjwhFNhlvplZY4tSWuECS/
 NMtBcIz4nsuAAio4hyG68661FlHWVOz6nVeETYoeNpKoCqhG3eqEMf3
X-Developer-Key: i=tommy_huang@aspeedtech.com; a=ed25519;
 pk=/SRU8iPtlyPCtlX7hXjYJhOTpCUdfEZ9pIVVyCQOjLE=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4153-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[tommy_huang@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:tommy_huang@aspeedtech.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommy_huang@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.786];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: D05FA61C31E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for matching the RTC controller on ASPEED AST2700 SoCs.

The AST2700 RTC controller is compatible with the existing ASPEED
RTC driver implementation.

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/rtc/rtc-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-aspeed.c b/drivers/rtc/rtc-aspeed.c
index 0d0053b52f9b..8f5b440f8c0a 100644
--- a/drivers/rtc/rtc-aspeed.c
+++ b/drivers/rtc/rtc-aspeed.c
@@ -111,6 +111,7 @@ static const struct of_device_id aspeed_rtc_match[] = {
 	{ .compatible = "aspeed,ast2400-rtc", },
 	{ .compatible = "aspeed,ast2500-rtc", },
 	{ .compatible = "aspeed,ast2600-rtc", },
+	{ .compatible = "aspeed,ast2700-rtc", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, aspeed_rtc_match);

-- 
2.34.1


