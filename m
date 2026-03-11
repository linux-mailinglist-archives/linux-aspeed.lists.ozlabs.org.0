Return-Path: <linux-aspeed+bounces-3641-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCxIDgQKsWnhpwIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3641-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Mar 2026 07:21:56 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A17625CC83
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 Mar 2026 07:21:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fW0yS6RHrz2xTh;
	Wed, 11 Mar 2026 17:21:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1036"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773210112;
	cv=none; b=FTavOHRguJ+v8KqLImFWujbTnT4AZjsmjH6L8HQon44Fk0pWn9k/rQcmzGVKz/RpjLInri6TNBmZ+OrRmWB9+y2jOJjqRT77jIQHLvgzOON0M2wM/ItU2PD0D3LfvhZRsnlkQUKJUWxz5Ggxefe+GYm1lz8IjD2PN5XZnjN0peV8F/q8vGTHo9y9t5vjNkFxkY5O3+uVylU/WBKK8TjX6QhFhDjhz/Vn0iOeWXpEZ3cj5f5HWip4D+wIuaHNu/9v3cAzey05I1y9o4wClx/SN5pkrTknoZhlDRqOWRRlXEvN49/YA6g2Gx4H2iqSXsJCeU/WeS6xnkNMMCOOCbPqKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773210112; c=relaxed/relaxed;
	bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e56SIbYeSLPinXmk0onqsbg0HNtLb15yfuY4PcYLKilRQnux0Eo67QsXQuIvRE9tNmrRtEDbO/Tas+gexC6wsxI/5Vdy4Nu++D8a9syfvfaI5i8tHrvil2Vw/hdL2nLEYFmHm4c7rG48mL/q9kUIlrp4/qCf4u0akawTcVIHYNxLo5JOlXo+neyRibWJ3vF0V9Eb5Bxg4Mn2IsAwK4GReQRtqoD08/ZaD3f11zDkDUTPb3s+p053kio0Q93FxWYKhO17wt8NXbQ4NtykWyZKil2aaqVlkXAyvH/LWWlNLED/docI7ENfCNvd+LXw8RKQdMdM0BJ3f5MiQ3K8PGgYMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PTrlKbrj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PTrlKbrj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fW0yS24n5z30hP
	for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Mar 2026 17:21:52 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-359832fc558so8289049a91.0
        for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Mar 2026 23:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773210110; x=1773814910; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=PTrlKbrjRCYtb2kbwrSVNp5R+3s/0xEdM1i/IDJOfaM7WsffA8hM0lQ6rdfklS8fGS
         y9x8QAZGnHO+wPGWGl+DVbZQzdtcnSvxd3L6RsD8rUYfmtpcFOs36hIEQ//cYVXKbSt5
         bSXgV5/rFAh2wnNnP4g9SOvkOH9kXCOqVqIk6KOhH/n5ajHg4euue0L6J9TNJIACOdej
         erh2+nE0RKXJdGA++y0qgBpX/nPbm5+UC4U+avjlpDp7PEZFimlLbQAYO4cUbPqrox2V
         Y82BzwTJPIYnK31gT0Pxg6QHboPjrbmkwVQVILMUgRbuMmbN2Stfw8JeLHYLgHHRr6RX
         +FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210110; x=1773814910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=OsRnl5HdPgfWdu8WLnrlN8VZZmoaYinMUxbcZuzKMNeNV5Cp3H2sGca8hbW+E/KM+n
         JFapW0e2T6u3oXKef68Nt5SzuWVfWCMHxUmVtF6mnnWw4g1AdeIK3x18ZlVPX70O85vj
         Ex8yAPWey3mPvqwKymGsuR3uMv4LckeKKVGK/s7NHn2yYuhoXbRxWOi9hWN92MRSeDAB
         Ozrcz2Ewx1eYeDVizMpQrMIjposefVh+XyuDu6mqDOX8AdudsoavLXbgTJIfPQ/A92al
         yJi2FRuTcdZXqW4RtKj0vaQVI4/Lozp4Y+W5F+ws3WmQw4hUkvhQHadII0YpZXt/edjN
         sekw==
X-Forwarded-Encrypted: i=1; AJvYcCU6e/6eloJVi+PgmRydlAX8Asd2snGmG42Jb2NR/aQbYRWDhn5GZeKtOJvnMQ2OvIN7SqIN7+AI03glgZs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzM9zoVPEJOADlbdP/Z6Mi+0ZPv8VxEG8uobv5rO3sy9mM7KEkM
	P6NX21Tv7OZekXCUH051iMJRoF4PHSF3zAN+6saKxDbulfMprfemJKDw
X-Gm-Gg: ATEYQzzz+uCPBVgaHLv3TKMrkf2ttMxwrxNDMZWEgQTMSfqJDba8dG0U9bDLJ3mDtGU
	3FL91rttDMNNKccHgeMfIW6A/0JUeuA9YjIKjjs9MZLPEoH4JwxgwlD6ySV1maF69bd2W1MEjg7
	RZd9oYhn/4m9QDlBRjP31eB1Ic0wq3mr53+xjDCDHG04mcUV+J0tqS+8u88vhoyr4knwvtjREZG
	xyd+IevdUAGotcT/eG5cZeHMGWdPLVJLR6MUREJ4B16m9N8dOJpX99k2XC75Jz/Nb+mFlEsSgiV
	zoqkXwEqx8yp9VdO9wnyBgQZBuZ11WDlAwMKeI9dZWjO8CcIGJg4kHcmTitOzvdFH0Y5RhonHpT
	BuXir5EFqToX0pVd59bjMfX8zbkKvXMUd5+R6KwCOm7pWfDVu7difEYkIurVVeItTH65BYF0bDq
	xawCDFJcwQgOGJHvPuTDd/Gmv+T6T1nQHwk7achEcqtlDRHB4UW9C8DlyXWLeHpza9e4h0b//OX
	10WbQPWcN0feg==
X-Received: by 2002:a17:903:298b:b0:2ad:cf11:5048 with SMTP id d9443c01a7336-2aeae7c7d39mr17260585ad.22.1773210110459;
        Tue, 10 Mar 2026 23:21:50 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdfa9acbsm1008019a12.32.2026.03.10.23.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:21:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Mar 2026 14:19:28 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
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
Message-Id: <20260311-sanmiguel_init_dts-v3-1-2b4d1ab7a8a1@gmail.com>
References: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
In-Reply-To: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773210105; l=894;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=505A4j1K+3BVyfKFAUJFkb0POt+oWwmpy0RpscQYCVE=;
 b=A2uKouFUmFPpIc+1d2JM6DuRLNpKNSsTbf5qhXW5G0z3TWQLHVqz2DyRpNDVzyOfvo536LvZ5
 DPEacuxk38KDBVA2zulneYlS2HN3XfaCIiHMNfEzeRIiVOxEUaJ+RNR
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 9A17625CC83
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-3641-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[potinlaipt@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:patrick@stwcx.xyz,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:cosmo.chou@quantatw.com,m:Mike_Hsieh@quantatw.com,m:potin.lai@quantatw.com,m:potin.lai.pt@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:potinlaipt@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[potinlaipt@gmail.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,quantatw.com,gmail.com,microchip.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

Add Meta (Facebook) SanMiguel BMC board compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..6c84e6c80978 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc

-- 
2.31.1


