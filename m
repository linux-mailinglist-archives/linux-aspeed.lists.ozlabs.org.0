Return-Path: <linux-aspeed+bounces-3861-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIg8AHCR1WmZ7gcAu9opvQ
	(envelope-from <linux-aspeed+bounces-3861-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 01:21:20 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAA23B5703
	for <lists+linux-aspeed@lfdr.de>; Wed, 08 Apr 2026 01:21:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fr2J8710Jz2yfS;
	Wed, 08 Apr 2026 09:21:12 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1775549879;
	cv=none; b=adpZbqBqbXMBnOBlnSkHuLlWY2830ULOM1u3ftufrBN0i9BU9PsMHIw2fgbpcIpEojMG1DnXBQg9FYI9Tcuv4hD41TtAGE2j4EhDooHS2QuUu0QupxV13pNDWML3DDGxLE+LuvOOlCPu/7f4xmTocIY02MPhh1N5mJRjq4Y0mBxLPvyiyNH9gCkCiovvLfyv6vjVYHsk+SSHBAhT46zCNEQeBl7TCG2gqtqJzMeV5uPP70yfWdIhQqaOvZaCvnt5W4l07JO7SDL10xDAeuRJv/ohyzCG0qx1ae8M4ZmOjhHsMrAp+fZFmdLvbCAwPEkDcD76eOvIr2R0eyO1C14S+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1775549879; c=relaxed/relaxed;
	bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKwBrBhffCoCemlXEXO7g2tS4HrKD/s47wdIVgsyK9ecPQBEr7k/pw3MqoGwL31Ji8twvCL9m6GYP8ctIIhbbVeDMDvpgOroK5+5gJeZ7J62nYP3mh99TcTE2q/gMT8u1OZh5j+2eH2g0Glq7mHXkUIgrZarx7xBS0QKai9JW95iyX7dFpxLiGKdj+ypkw/LC91AoXlpAPCcn/chQGqkFy+Q6jgx53iivlPBPjhzA+K8zGpycMEhJxgFaZUQnuBvmT2IsAq1GfMQNym5S1NnnYlsAvN3S1g+2vvl1ltlblRzGT5qZfaLJaqkJxFm3A9El+T8ex5d8PQwb7//uEsdOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fJFHSs+L; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=pkleequanta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fJFHSs+L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=pkleequanta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fqfFy4qPhz2yhD
	for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Apr 2026 18:17:58 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35d94f4ee36so2621264a91.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Apr 2026 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549877; x=1776154677; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=fJFHSs+LuYIot+ua0h1QqZ7Ll/2uutPZtb9ghclxhybMmglhBG0zxzznVYhR7PgAsv
         CB8f+IYuC8ykYVt+Dq4NE3b8I5zPSBTndHkve7JcomE9IoPL44Uud8v2wiP8Qfafh7YD
         BCgC/KKQ2BalVsJ7OXUGipZwfysl11kpYv4zsngOeM2DWHngmpLTbdOWHlkNaA0CZ9Tx
         ITJVvBtqUabTn4lQ4E+gnGiw+ghEQnzUl+04ip9YgPlZoxKRfbvNnte7lEzSehzvTHmY
         Oam/3IAmAHk8gd62NiSasVgS7aV6pLgufMmVyZwwIlv6vDc84cs45Pmk0mG5wBDHzyLh
         7POA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549877; x=1776154677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2M1mDfXgnz5T52hMj8GNJ84lRse5GAheeg5uX9GLBPU=;
        b=rtpPEmTW1d7R+5h9xfd2XoZkzhKjYbdwAplvbqkjOtNlxDznjRIrSEMDbrrxqvHSal
         F9XHtKC44w+GbbEmPbsI1Cqn5UM/V2EFprj+QZVW9ur5t28mjYi3uIWtqIWH6RQlCk05
         M9dnp73D5Tjagg7cBvAj0eAp5AnmCJlUlAeTBuvMIvsSr6iRUYVES0ckOi1R6zlFd6Do
         uI/sApeYFB9lx20RctpNJOc6F9IirrGHMo/pRKRNYFqYeiykHlFx2RrO4C9M2As66U4y
         MQTnAsuEOlkAOWqXS2fEPYu434jHuu+xIFoFM9iSMN2Vz+WM4X7HMXkxrWVRRhxCrEWz
         N17Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxQ+aa3auBczVtFPMVxT8gofPe75/iA8hW+H6MKeVuoICFsw0APx1ZdyzLnga8QC0zFciJLzzRuABnuNc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQcGh7zikSAyxS6RQFdUH6PFcVtslYfO1tKH4+pIIlD6JVyjIL
	WHoQaOdFMMyVl8X3ubqLQHx+Dzmzkp5gOBtnCRkSwSOpMRdS+auD9G60
X-Gm-Gg: AeBDievZ8sMd529AU2BLy6LqJfxqO5C3iO4uzYQ0DsAKSq7euQVq6aGDikMKSMLA97P
	pyVubTbdfPzTdfr6semPrf4e946HHoix+yol5B6nCw+V4ryYYWiu3aRPF+CpBqkkVIunYNNM5fH
	MXY46tZmOZ3C4JupFXm7RnFTuCJr1WrrWFhwqGHm4HVkl+QD+I2UTv0rhMNfrww+aM0YnzjFbDx
	exS7G1BFyw2xMYAZTmeOk+jq6okpl4EFaCu8LQLnxd03N7qngkg4mjtkGr0435zxm9Fg3+LkQaT
	f3X8rMLAU6CQ6J2Y3sDNP4Ge2KEf1WglSizFXM2vthL9pFjxTKwq84+7YvajQsqrH6wsKOkRzXv
	ff96esXba3X5B8PI+XNIWxFzNV4RFCGyDvsyn0vFy1vsg/fmgSXx0RzfMBTwpEzQPUzVilQxrc9
	LaYOCET4sn3ifF/wxBqmrn2Jb7d+9q2vapltGRLLGj1pHO0hAY4bqpJsAtWgmmmVeLEJKuvyHRE
	I6qQY9bPir0
X-Received: by 2002:a17:90b:4b92:b0:35b:e4d8:e21d with SMTP id 98e67ed59e1d1-35de678f2c8mr14931420a91.2.1775549876544;
        Tue, 07 Apr 2026 01:17:56 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4592889a91.12.2026.04.07.01.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:17:56 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v13 1/2] dt-bindings: arm: aspeed: add Meta Ventura board
Date: Tue,  7 Apr 2026 16:16:59 +0800
Message-ID: <20260407081700.2658011-2-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260407081700.2658011-1-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3861-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[pkleequanta@gmail.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:robh+dt@kernel.org,m:krzysztof.kozlowski+dt@linaro.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:Jason-Hsu@quantatw.com,m:p.k.lee@quantatw.com,m:robh@kernel.org,m:krzysztof.kozlowski@linaro.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pkleequanta@gmail.com,linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.978];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 4DAA23B5703
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the new compatibles used on Meta Ventura.

Signed-off-by: P.K. Lee <pkleequanta@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index aedefca7cf4a..afabfe22c8f3 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -92,6 +92,7 @@ properties:
               - facebook,harma-bmc
               - facebook,minerva-cmc
               - facebook,santabarbara-bmc
+              - facebook,ventura-rmc
               - facebook,yosemite4-bmc
               - ibm,blueridge-bmc
               - ibm,everest-bmc
-- 
2.43.0


