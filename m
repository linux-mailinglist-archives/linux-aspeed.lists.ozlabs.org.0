Return-Path: <linux-aspeed+bounces-4288-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yy/tCLYcO2qLQwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4288-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 01:54:30 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 297016BAA1D
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Jun 2026 01:54:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=VntUyo6H;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4288-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4288-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=1")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glMNx6r3rz2yYK;
	Wed, 24 Jun 2026 09:54:25 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782224982;
	cv=none; b=UJH+T5DIa6H90XPiZQCuqMiGaljygNXjoxZuinl9fnYReIijwdCZe/rZGfd1wNwvFI5VoZq4QeZxK19V/o4x6Q+UOwuPwpaTEsSxvc+hc8BG+4fogEaqYA3lsIYaeDzVWGojTnV0QH9ss2K2hUXrZLqqI/WAfrg+hJkda9NxeFiO6ulx+MVu8ExhmCluPcEv/bn6RF+oBm33Cj9arrltz2F+5Z4Ec8CvyBibr2KXEkhiFtUzq0DenBDLWm4c0fo91vdukyCs2HCm/G6ir9BaOBmfeRLglyNXILASd+CNmZCywqkdtQQMJx+t92oUlVHFjPi/voHgcguYJ5BvnFqLlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782224982; c=relaxed/relaxed;
	bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mj2Lpdk26Md+SN5lfucw6cXdSqbChchbqNQB6hXgIUf30xjVyJB+eKdumld03duCAoKSn6FdeivXjnJ0CcrHPXq+uc8nCvA4gJMjnqDc3OTSFdCL7pdSB9gyPuGHdJ81wRz60s//MeJl3wQOp7HiBlr1Cl3CRvXX6STg4t7+rEPaKJzB04iSnQBSL646qBvsRq0zqKF6BHruf1Ca65Zao6Bwd8Qr12eTMvNSsbOMTEh2Ay0PdSqY6Jiz23FQXIin/Zjp2rbZNw3jUAUgncC6by0G/DKhAdrUkhZ/3o4x+7s6v0SX7AyJORIS3jdqY7ksOKICTGHC/JjfjeOXSfE1pg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=VntUyo6H; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=gregoire.layet@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gl6sK46q8z2xM7
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 00:29:41 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490a76757e5so36114755e9.2
        for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Jun 2026 07:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224978; x=1782829778; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
        b=VntUyo6H+/ZKz8wYb6gUGzQmGNrGVwWvhHOUG6ViAP8EcAjOTo4Yt4Hxr3NQWxVy7X
         hFEP0osUxxhbuOGH6CvHMRJAbimL6FyVULbRXwwlRIy/P/5YGkxEkgz+IEIb8FZRrxVf
         Wl3hqQ7/Y5d8dsCmC0BlCtY7d3FFmOs/kOE9xxM8dr+CWudSvzu90a1sjTXmi7jwh/jg
         +Kn/0HUUPifRuJ2/ucKUeHWfsfFDnLjc5TQMwmxovyD37TwYxCt3UUIFS1Ar1/C2ujkx
         5e26lqTIPmj0qPl37pekHslWjFIbhkFOlD2Caz+EXljifrE2mRZXpicc+aVL0tHl3nsU
         hfLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224978; x=1782829778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
        b=tBkdKpdUmlXRhKROqOMRLMyDzjl5O2Dwrb0hVT/h7SSVGUb1MFEzL/i5ahR+L/1jZ9
         QdSgKBPMs+VoNhR0SfgF9EP0gNXWd5FfGhMjz+D7+DkOlEK9jclr72M72Cbgeb3mnY2R
         ejC4CxGgVVlx7iS/lPB0R1afN9GkhtqBeISb7hRVdx0ryLYrWq7Z/iJe9rqQQRSv/++B
         KbVrUPQYntsD4SqCepC0V6PBk4veDptk3B+pLAsS3uHEPp2RKsbfDJzpGE3xpL5j9Xi5
         TqrMe8yX1ToW6QGAxsSu7bMmzJzwAlH68z8Irvs6WV4fwNkaEMVZhgZXr1R0PqPfR8UW
         qZbA==
X-Forwarded-Encrypted: i=1; AFNElJ+SwvNUc+GsDmeL0McK+43QO1DHvyz14q6RG2F0NCLUWEm9XHJTlxs9J/7a6bHZeN5fSzdkihAOCidw4ao=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzKL1PKOgP9LgYjdcxjwNF9f2ciX17uF/bbW+hgajCibDaw7DP
	S6YTf+WqBzx/esT/OLtP6sIvd3jt0ri1gevhg6PBfc1LGdef8hNDx557xahMej4XUmY=
X-Gm-Gg: AfdE7cmKDiUURHJPdcMH8AFdwiIsIWi2pVGObH/6wdG1A9xghl9JhoHnG9lyOQsxci6
	FoNDrNs/WLjhny5dbEkapcwHPk+5ypig1ShPwh9TdsnyT8q4F+rCR64gBNjexoO3+AMN87hDeVe
	214/gNUywJj4vs4x0R9Lw9hqzD5TBVeW0T9mRjIl+Ag6lBqwsY8dA/6g3KlbDQiBR0j4BVexwnY
	EsjR8VrBWUHyguQUcn7d/FeXMDS8xGpTkYh+kq1KgS2FHg0bcifSAbE+W+jOPkuYTyxB5R2h1w+
	g60QPupdQVr7YJdTb2HbmCg0BXMyGQz/a/RLaNX/TCPpwfcYzXDjOb8preR/0F8IF7kw+L9LdUr
	YI+P+vmGjA9U+T9l3he21Xbjrj2vrPtZBV4yfHw0EfgHXXmDuZtNaxg5SzSoTxbDHcDgcvBvseP
	MmgxUu3mC5g9jlIAzadSaRW+8jd7CdMQwqRkx+REqvMSmXRu3VLzkQCIXDSSnw7SbSi35AAblhF
	oo5osYUD4AgsSd6HXGv0LvkBwGy
X-Received: by 2002:a05:600c:8b2c:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-4925b3b1732mr44346605e9.28.1782224978401;
        Tue, 23 Jun 2026 07:29:38 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:37 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
Date: Tue, 23 Jun 2026 14:25:39 +0000
Message-ID: <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4288-lists,linux-aspeed=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:gregoire.layet@9elements.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,vger.kernel.org,lists.ozlabs.org,lists.infradead.org,9elements.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,9elements.com:dkim,9elements.com:email,9elements.com:mid,9elements.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 297016BAA1D

The ast2600 was using the ast2500 vuart compatible string.
This change makes it possible to have ast2600-specific properties.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..3cbd0f532e15 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -23,7 +23,9 @@ allOf:
     then:
       properties:
         compatible:
-          const: aspeed,ast2500-vuart
+          anyOf:
+            - const: aspeed,ast2500-vuart
+            - const: aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -287,17 +289,19 @@ properties:
   aspeed,sirq-polarity-sense:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
-      Phandle to aspeed,ast2500-scu compatible syscon alongside register
-      offset and bit number to identify how the SIRQ polarity should be
-      configured. One possible data source is the LPC/eSPI mode bit. Only
-      applicable to aspeed,ast2500-vuart.
+      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible syscon
+      alongside register offset and bit number to identify how the SIRQ
+      polarity should be configured. One possible data source is the LPC/eSPI
+      mode bit. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
     deprecated: true
 
   aspeed,lpc-io-reg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -305,8 +309,8 @@ properties:
     maxItems: 2
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
-      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
 
 required:
   - reg
-- 
2.54.0


