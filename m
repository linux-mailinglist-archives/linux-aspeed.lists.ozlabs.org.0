Return-Path: <linux-aspeed+bounces-3538-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6J4dJCTcnGkrLwQAu9opvQ
	(envelope-from <linux-aspeed+bounces-3538-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Feb 2026 00:00:52 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B602317EAA4
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Feb 2026 00:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKbtT2jS1z2xnl;
	Tue, 24 Feb 2026 10:00:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771845464;
	cv=none; b=Oe+XJpZL7eVyxybRLis4/NdGH197GcAD7Fe9cmUkS0uFZGlQVUfNah8mm2IyercvEQlMuYo2aFxpCQDUegJen73lbIj+yhnffiBv4thCUGdp5do3xwI4gWTvrG8dUayA5wknfioZYxjesU3ZjG+fPFsdev2geakvJvSsWaKgHJy5bGde3f5BEwIwDvAzQgwUj4OYgHrE6W1OwJ/VmOndGTf/wY0byNPdSA0e7Y+MxSwvwG9KluFbS2q9kvep5RGltKOdDkyui7UAMUQeOfswvQWG2+lhrMjtvQrPH3o6CFEl1TAEJgz++MLlukN4/Bgli5d7wy3nPgFYzvJBcVsFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771845464; c=relaxed/relaxed;
	bh=dekzOzjCcZH9VxfMLTSix7P8omyyrbtHyX+5U1//3bk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzqdrgOlBQ4hrpItdumsTNb+iFWuDAlHWZzC1JncrQBcrVMEOiLZACSsdzQGnYwFO2DOkr5IgmhP7J+OpyOpkcPXvWCEsIT2/ou/Bb7Q2LCGKee/ytKRUAh8ORxgqB3Fdfhdngf9vQEmfg+UMrbT4NTQ3Pw96fCX7frxd5SqUfnCWWHnXMJhD/9yoP+wRFocQYSbpcKFntClld1EqomjqRNnLWW+bbImDCJhOmCneU8+n9j2PbW+eNDnlgqWu/hdMTl4FFwSr/Pg+jblWk+n+ZSjRNoboyCiKSg/DSycFVNWGyN3bvo6yQ+3R4PUvHqUT411JawT2fbc7MySZHPSug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jA5iVz7a; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jA5iVz7a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKJHD1nVyz2yDk
	for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Feb 2026 22:17:44 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so1787691a12.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Feb 2026 03:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771845462; x=1772450262; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dekzOzjCcZH9VxfMLTSix7P8omyyrbtHyX+5U1//3bk=;
        b=jA5iVz7a5ziUP+qidQ1SGJi0533oqncDHT6SyEx/qHt/IqtOzXNcmHq4VcxE+skR1O
         /vxflHmBrnOlUre5dEbJZYeQAUayQYIGQ3XGhwelJWsL+1DkPgeh720I4TgD/BkLb2zw
         lM1rhYgl48GWRo2Vg7kJRJoaoKAVKxutqf5xpDL4GKe1GEnAuXmUEaCZUuSC/TIUE3c6
         SXulDgbvngEJ0V2936Yv5rYRMPMERBKdQ9rdlh4yd1Pc8I8XBRzafOL5oRaImzbrdhNB
         JJEi+LXyWWGSli31eTdQLyHnA/zN9BYQYZKroQ4ZJYGG5EF8eUkkLYVuHq15itjMRNW2
         4IVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771845462; x=1772450262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dekzOzjCcZH9VxfMLTSix7P8omyyrbtHyX+5U1//3bk=;
        b=NJObGbXQxUSs84qy9OJbhgt4r/NQnVHlq8a754mSDksUxA3e3QJVoyWqeGMQKDxdSP
         J+bfB8IG8+l4AiiBiH9S8kOlFyhBTzX2hpqVyvVmiueKfTS/7Pq5paKgm8IPHf/qBu8W
         U+etXF1xgOKPuB7xZ1W0wFX3yKGovqlc6PwPRZHN+bYahxChVkmwsmCCJ4B3HycCqGJ2
         49csb/X4Vh808jDY8qQuVuaQ7LDUuZRZjCUvImwP6GNHm80BFAxJ0uKtf4a6GgtgtJMx
         oqwHMuwcq5QzKKj8vCg3yzbEi6iDvmWepHLYHO9KxhBJ7kqwBICrc4s3U+exyvjRFzvO
         5Xgg==
X-Forwarded-Encrypted: i=1; AJvYcCW4MkFpw7QXxzOO9dwlZUQttr+GVCHJNIdnuHlT5LESECl0ZnwixH91R9V/W909BbGoqoyOyEPGtqJngQI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMB1mYgeTj90/kJRkLB8LMpUSBzxkxpE5hK/lWv64N8wVvKUtk
	oW9SSgXj4AlkM4r2otiKT6x446IiIA7mHWv3n5dCag5pY6VKg9f7BpOL
X-Gm-Gg: ATEYQzxB0+/qT0qggfhIUdtq2YRvY300vefY/gP34srdHUmiuYHlVnpJHV8E/XM2Ifd
	Lpj/MSiQaCPPP4oT7R3RtYgKoLNs1K6Z4hA4nZD6dOuPo6ax9qQdzobsTL2H5NVUz7FYIrgB2VZ
	vkZQrsQicC0Mc5n45TPyykcGD24zxff1sOb16jih1G7HvQGwORrPNRtfINCcPV26V4vxc4js7X2
	W00QCCSS0gKGbfXdStyVXuotuhmDI7Sj6t+t2SFaVz4JKomqZsEKlkpdg4aTjCP8dnCI79VAjrx
	9ZSz3VXA+lwmV4xnSau1TKE6cNe4Wip6lqwwU2ARXLsSNL8PHcEA1SxTvTqlJ/mRmeuJvM0HVWf
	AhqjP1bsgbCJo9hqYDhRDbCE4POX0QOj6fSdIS3nIl61LNW6oYJ8WjLTAJkz6eGjAE5akPqhH5X
	uvTr44aHG2NlKhOO+PggLCYI9nYzCEP18OSjY/O47exh6RoGcCzM9wJb1zAW1ae8NCkzHmNvm9M
	TbqfKfmvlBydLOGtnxHlj6s0wf/9MFNj4jqOidYOnVSnIC+DmhgyR+MACqdYdUic8pv6aN+f7Dv
	n40/sSbWtjW27csV+w/5
X-Received: by 2002:a17:902:e88f:b0:2aa:d289:2d95 with SMTP id d9443c01a7336-2ad74463f60mr80278615ad.17.1771845462066;
        Mon, 23 Feb 2026 03:17:42 -0800 (PST)
Received: from 2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net (2001-b400-e3a6-b683-040b-c296-04cb-fbc3.emome-ip6.hinet.net. [2001:b400:e3a6:b683:40b:c296:4cb:fbc3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74d36911sm71799335ad.0.2026.02.23.03.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 03:17:41 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 23 Feb 2026 19:17:33 +0800
Subject: [PATCH v5 1/8] ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12
 bus speed to 400 kHz
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
Message-Id: <20260223-yv5_revise_dts-v5-1-fc913e902488@gmail.com>
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
In-Reply-To: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771845456; l=1020;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=Y8FxaZ3tGkhfSNOMUB9wrvZLgHj3UUmc4MXQt4g53Xs=;
 b=9PqZ9iEvttl4uBW+fcNE3uPsZFp3PxYjAx1wpMdNwgGio2/smtdbhOC9H8Xc385a4xsseqnIC
 517wY5pxrxlBN/jjCoUegTvRbKseZvnPJXc2fms7ZaE3+VSHms9SExk
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-3538-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amithash@meta.com,m:Kevin.Tung@quantatw.com,m:Ken.Chen@quantatw.com,m:Leo-Yang@quantatw.com,m:Jackson.Liu@quantatw.com,m:Daniel-Hsu@quantatw.com,m:kevin.tung.openbmc@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:kevintungopenbmc@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,meta.com,quantatw.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,0.0.0.10:email,4b:email,4c:email]
X-Rspamd-Queue-Id: B602317EAA4
X-Rspamd-Action: no action

Configure i2c4 and i2c12 to operate at 400 kHz instead of 100 kHz.
This update aligns the bus settings with the hardware capabilities
and improves MCTP communication performance.

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
index 2486981f3d6bd36f3fe780b21e834b85242f8aa9..7991e9360847532cff9aad4ad4ed57d4c30668a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts
@@ -231,6 +231,7 @@ sbtsi@4c {
 &i2c4 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {
@@ -782,6 +783,7 @@ adc@4b {
 &i2c12 {
 	multi-master;
 	mctp-controller;
+	clock-frequency = <400000>;
 	status = "okay";
 
 	mctp@10 {

-- 
2.53.0


