Return-Path: <linux-aspeed+bounces-4103-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLaGGffHDGrAlwUAu9opvQ
	(envelope-from <linux-aspeed+bounces-4103-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:28:39 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2130584B32
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 May 2026 22:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gKmTc44gsz2yD6;
	Wed, 20 May 2026 06:28:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::534"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1779158333;
	cv=none; b=I4FN+8Sq1+mSBIwJdBglMlWu6oKzUamjrhYhqbbME62bK+LGfL/gDQNp92jwSG0+07REH2rM2a39QylvFIqvnFF0tPppp5ADz63Ihj4xrfVRQQXkhkvQsULR29oCrKUB6eZb5aKhdM8DPuqhoIxNLmJu+M0eU59JhT3CtD1YAcaSVSYPfhvjUMX2OHseTRja2qXr9ELT+bfSDB4Sridp6x98uL9/5wRuXc6RxpKTSZoEtucgmzGVSfTYihqTVfWo7WqG235JmX2zFdcWnNgZv2bG1FSaahiIoM7i/G1DR/WWj8UoFEvVGPFJuzI04Wxm8L76vEYElhn+gZ+IpqUQCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1779158333; c=relaxed/relaxed;
	bh=/kA6tgLKUjuyzF92vWnLnuV9dyaiQzrFuN5gzvVQORg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WRANq289zvFXbnm9yIuTkzLiFn5agbS/QGqtuDPMFFcjPzTbCBuNELPeD+IxIlqp/BOKFoMpZasOh1kFxugFTqbUV1ix7hpSuB83G2gEP5nzzIKueLjcaEtnoLC4TodIqwCkXiPSPnVlRJRW73597amkr0YOAaLzYX9ntiz3Ini2u1A67GKineqkWNOSMLzK1UOhPWpkvl2mWSP6zLMH0eP4q+0ltrrLa/eJNL1R/Q8BqfXTWRi0ij1x2lu49GSh/S3k8UOqhPsZ9ht5B8/j5HQ4OKpwWBRglevXHsr+glpjO/D70scKkMRMK7ctyx0P4IAC9TbOUQ5903BmaA59Lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V1ZGEAyy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=neilcheng0417@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=V1ZGEAyy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=neilcheng0417@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gKJlJ4QHXz2xwH
	for <linux-aspeed@lists.ozlabs.org>; Tue, 19 May 2026 12:38:52 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c7ffe8eeaf2so1230843a12.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 18 May 2026 19:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779158330; x=1779763130; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/kA6tgLKUjuyzF92vWnLnuV9dyaiQzrFuN5gzvVQORg=;
        b=V1ZGEAyyxA2O5wAVc9oPBYPVmCc3tJt/UFhXBbiq9u+McTlQZmJGuO+GfuRU2td0Gx
         T9cc1srCXGNWrNm/q6WIVril9J0cTgWrebpcxK7hktqpXp9xufbbGr9Qo9cD3P7tT3M+
         6WeNzgokkKNz6k5ow7ahSLkvoBUyk1K36axiEln/dmu4p3XxW5qODR81sR+esZO7DAQV
         xW/ptPGkbtv611mtI9s/LDWCKDGKV/ecZeP/YY6X7JK4Om02Od4OBSToiSka2uVkG7TI
         fhJqNla+SJnSHg2OVMk6kVUq1SEC4CbS7OA6Vdnzhc3zi7GfRrQj45rHCTjM1ANYbAZY
         1/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779158330; x=1779763130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/kA6tgLKUjuyzF92vWnLnuV9dyaiQzrFuN5gzvVQORg=;
        b=V/67S2QO35/+bT9aD38ff8Y2CCr41cEincoI9eQhCtldLArf7ZTx9SWH8MqmM3AqWB
         YxF6yo9TxJw/nFoW/cWQPLcVpZPaP/yx1/5YwosIPtMHLhpUsFZBQTvyn8B/HkHaS5Ul
         ubAOzFZ81Yv++jOWI0uzFEBrLoawWK+zclkz1BQtP8+vFDiXUGCoU7U3pSj+x9XEsxXP
         i639oOgGFPVwRIiQ1r3l3JmgcBs5vv0x3cWcotIq0+UdrSmH6rpDZamYScSoP3g3C+ZL
         diskKikoJqhhJ3/H0efhwE6K4g9KD4ac6x6G51Iz5nwEytMn6crkmCBqWDhdDkDa4JMs
         mP+g==
X-Forwarded-Encrypted: i=1; AFNElJ+lvCHQlnFhaGB1oDvprbwCo53nDEOBOMEhA+tf6Mi3LzlaG7c0ODzlT7AwBTYpHgGsEKxscrx+jvJBMME=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+W/fHQ6shiO6DcqaFwpF3NAveUQ9e7y4id6ReRT4OXviSc9Mq
	v9us4jkQoeZ+2hw+GnRT2DdKZpTJNYaIqDcpH2zYq9WnE/uU/kyYj6xX
X-Gm-Gg: Acq92OHz2aXEugx5xvA+nSRtTLxKQ5QivXLQEO99kS0jdRa/wmr+3Ls4/sZq22oGf59
	vtUogweUh+/nVsgMUBQKOJetxZCS8qx4I2QI3dtVurtkYnKIlIPgWhwF/PRBY8kj9N7HcXR8AUF
	P96SjbzrVYdhxlCk3oyaAimNz984vYY9MixcGLwQEKN6Ez28+l+2+wWVbn4LdrJmKbkLHTSgfcJ
	k03L172iDtzsqmktwMYkIY6PmVQW+YR4EdjVIemUlwSBQvdMZ0BWA03I8c6EWelec2jRH7ypRs9
	k/I0lkR0KDNqLA3A511xvVcElFp48d75JCsNL9h1ZLK0xVxjefG0Y5UDh5mh2ODvcmCUz3ZZZ9i
	QOAoKro2klCsmtu6woKUkWONRPV1b1yPbbIgG7w4pm55l77oRDSpKawK3TiyDcPsdm/5rkMI47h
	eMzz6gf6GUo770J5ESYK4z4L5c8whLgAp7Ci7YkoJ7LNIE3p9R2Yo8YBdoniT5hVbDqXrTfN4V9
	ciNgGFFir/7Ew==
X-Received: by 2002:a17:90b:260b:b0:365:f8fc:3846 with SMTP id 98e67ed59e1d1-36951b87209mr18957919a91.22.1779158330480;
        Mon, 18 May 2026 19:38:50 -0700 (PDT)
Received: from open.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695124601asm12407713a91.2.2026.05.18.19.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 19:38:50 -0700 (PDT)
From: Neil Cheng <neilcheng0417@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Neil Cheng <neilcheng0417@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add Meta Rainiera6 board
Date: Tue, 19 May 2026 10:38:37 +0800
Message-Id: <1849ce935900a4766823e2eed87789a154426553.1779157117.git.neilcheng0417@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1779157117.git.neilcheng0417@gmail.com>
References: <cover.1779157117.git.neilcheng0417@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:neilcheng0417@gmail.com,m:conor.dooley@microchip.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[kernel.org,jms.id.au,codeconstruct.com.au,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neilcheng0417@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4103-lists,linux-aspeed=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.ozlabs.org,gmail.com,microchip.com];
	FROM_NEQ_ENVFROM(0.00)[neilcheng0417@gmail.com,linux-aspeed@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linux-aspeed,dt,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: B2130584B32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new compatibles used on Meta Rainiera6.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Cheng <neilcheng0417@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 8ec7a3e74a21..1a2252eb08f1 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -95,6 +95,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,rainiera6-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc
-- 
2.25.1


