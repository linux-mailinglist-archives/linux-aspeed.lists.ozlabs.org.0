Return-Path: <linux-aspeed+bounces-3723-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CqIIVjfvGke4AIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3723-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Mar 2026 06:47:04 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A61252D6070
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Mar 2026 06:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fcWm50QWDz2yY9;
	Fri, 20 Mar 2026 16:47:01 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773985621;
	cv=none; b=JBlFAKfrftSyiM9tw/1JJaScvk++TVqf3Dyfuahm1japw6gJpoqmgZ8n/SaHBXhWI4c9SC/MulWPgKfBQ/Tmroxp9ZQz8bcu+HrTrzFnMU6Z/HO27yWLmrc4IEJrEHGW2/r9HuQ23urSWLjnLVuCN3MuUsckXlkqjxq9KHVcDp9WIyqZWrbW8i8SLJS6biF5UfX2GKePSC4C2JY3JPg20uqXLlSvBAJ1EirDh/SHro2pZZ31rfPW5Jy5ibf2WLpHg3YG3LSpRs36BTHXRIVok34blHwp224AneOUtYv6GV04Pdv/BHZVXhxey/ZVTGAZJKZPfQNbWbPEY4YNapYl7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773985621; c=relaxed/relaxed;
	bh=X2ewN6JDf7ilJlFbl4JFZV56IxJkx+VpuABCKSEvxNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mnuhBYv7Tzx8CIgauIxSMJ45BxspuletaN6yNU7Nt4Ke3y6ZzbouXRHvqC3rSuTmCUTE0pf4k2TGau1bTy+RwjvDThapynpRMcjEP58G1m/GKOTGMXFvGjtPn38tj2T7A1yXXo3xl0Ay4kxuQsEE8YhoCWQSBBkEGfbPtVbbonoUTUmUh3o20DGrrxEKKS9ex0lLKjKnT4Uf1QKbOaJuXyYSlg5Wd97OcvwM7Ku3KCaodNAZ9Y7AIOhJ0SHebsgmDGzyqLO8ezrEXVwB7+sn/j1tLariaBYebcWuTM/yNG/x1Y9o+5W7zgrt/bhWenp6W0Zqe2fEHbxJX+Xzp7Zmsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=billy_tsai@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fcWm41xLZz2yWK
	for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Mar 2026 16:47:00 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 20 Mar
 2026 13:46:40 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Mar 2026 13:46:40 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Fri, 20 Mar 2026 13:46:35 +0800
Subject: [PATCH v3 1/4] iio: adc: Add battery channel definition for ADC
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
Message-ID: <20260320-adc-v3-1-bc0eac04ef7c@aspeedtech.com>
References: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
In-Reply-To: <20260320-adc-v3-0-bc0eac04ef7c@aspeedtech.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
	<dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy
 Shevchenko" <andy@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<morris_mao@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773985600; l=1633;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=U9UIMT5MY4p71koRPdELGX4IvlmgyoiNubG0RreHjtA=;
 b=S/vv1jCj2l2SomhOwzSgeS124qs/Mb7r4uTu4QaXqK1A6yYlgQ1LI3SXtTfiJ5WYfKrz7Z0l/
 V16DTdvnu9jCcTaHZkL6Un1lFxrfbhpb+vOPUkGMskBrk3oABIQkZOC
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-0.01 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[aspeedtech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-3723-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:linux-iio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:morris_mao@aspeedtech.com,m:billy_tsai@aspeedtech.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[billy_tsai@aspeedtech.com,linux-aspeed@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-0.992];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,aspeedtech.com:email,aspeedtech.com:mid]
X-Rspamd-Queue-Id: A61252D6070
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Defines a constant for the battery sensing channel, typically the last
channel of the ADC. Clarifies channel usage and improves code
readability.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
---
 drivers/iio/adc/aspeed_adc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/aspeed_adc.c b/drivers/iio/adc/aspeed_adc.c
index 4be44c524b4d..8eebaa3dc534 100644
--- a/drivers/iio/adc/aspeed_adc.c
+++ b/drivers/iio/adc/aspeed_adc.c
@@ -75,6 +75,8 @@
 
 #define ASPEED_ADC_INIT_POLLING_TIME	500
 #define ASPEED_ADC_INIT_TIMEOUT		500000
+/* Battery sensing is typically on the last channel */
+#define ASPEED_ADC_BATTERY_CHANNEL		7
 /*
  * When the sampling rate is too high, the ADC may not have enough charging
  * time, resulting in a low voltage value. Thus, the default uses a slow
@@ -285,7 +287,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
-		if (data->battery_sensing && chan->channel == 7) {
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL) {
 			adc_engine_control_reg_val =
 				readl(data->base + ASPEED_REG_ENGINE_CONTROL);
 			writel(adc_engine_control_reg_val |
@@ -309,7 +311,7 @@ static int aspeed_adc_read_raw(struct iio_dev *indio_dev,
 		return IIO_VAL_INT;
 
 	case IIO_CHAN_INFO_OFFSET:
-		if (data->battery_sensing && chan->channel == 7)
+		if (data->battery_sensing && chan->channel == ASPEED_ADC_BATTERY_CHANNEL)
 			*val = (data->cv * data->battery_mode_gain.mult) /
 			       data->battery_mode_gain.div;
 		else

-- 
2.34.1


