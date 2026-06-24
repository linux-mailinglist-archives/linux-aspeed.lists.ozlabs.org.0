Return-Path: <linux-aspeed+bounces-4304-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LDVdH6JrPGqDnwgAu9opvQ
	(envelope-from <linux-aspeed+bounces-4304-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jun 2026 01:43:30 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD386C1E83
	for <lists+linux-aspeed@lfdr.de>; Thu, 25 Jun 2026 01:43:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=9elements.com header.s=google header.b=LHGHNDje;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4304-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4304-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=quarantine) header.from=9elements.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=2")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4glz5h1CNkz2yZZ;
	Thu, 25 Jun 2026 09:43:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1782305301;
	cv=pass; b=H+fLdShcEIj0AE76ryU6cHCHkDe9ygpqYqDwiUIQDSYZVsTgh3ONNgAO81UU+wjSGcrg2Gl0VTkIL/zkZYReDI72EVygmOtB76fe1JcXKB2nALNYl91t7o02RygjQg/mfx2EqWHz3sltXxmQj6rJuhZPiGes8qEOTdyLAaMmxdTrg3uOoFzoyaDrqtlQA50n3l6XqLEAXgd49tV5XcBQh1NfWMfzQZRudymEdkn7TBRfGTXaJ18vuaTM1ZrEah0P/wGwYzUn2q/I4TA1Rs0fWN3CTMbda/PO3/ImiLrtus9RK0run+r+f/9Hq1McLPmnlBDYFjHFPo3uTbZtmXs+kw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1782305301; c=relaxed/relaxed;
	bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqgEvseaMhXq8unEHfeWugL4z/B40J4jxz7x7BCdzphAPdte9lGcNCivtuSlsG2Rif+xXrxGl4U+D7tYLkJ5Kp9JJwcE6AUttvOg6+LZCv/ghT/keZ42YDepump/NSer3QhL5flMlXxA62Q78fg3E//u4QuqLMrcnSczTGugQVoadjYvIqyUheSKgVHVOIgiCHNplwioTHWauKPSq5UMr9uykdhtDBld11JUF2DBegXJMxbkn5gWJ5pYb+JlcjBtS3i/e5Au6q/vRLB7V6aIZ2yOyf2ybaBNzaPz65NGLAvfia7rvUiwKsjMxLiP4H1kK/3gza5mIwWSsw3Z1IQhjg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; dkim=pass (2048-bit key; secure) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=LHGHNDje; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=gregoire.layet@9elements.com; receiver=lists.ozlabs.org) smtp.mailfrom=9elements.com
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4glhYv3jtjz2yRF
	for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 22:48:18 +1000 (AEST)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4923fb1f095so10178565e9.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Jun 2026 05:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782305294; cv=none;
        d=google.com; s=arc-20240605;
        b=BC7Yca//Mq6JbO1fP/VfBnc86zr+w7tmZPpGBkGTvbefzLNxXSxIXhjoEhBWIDDmlI
         Fg5zeFZ5eoym+3S+VRKDQLVxUYVelp7xOcJjZ0Jf4aH1cpfVhMlAYpIyh98dT5NCLdLC
         /VerGZOURm3qe147fUGsjMptlJM0cEeMj66SuI9ld9goeODZlwcMuB7TKy2TpvlpHrxr
         xyF5Os7QF34QSA5rOysYW6DZ1a6cCmSQuaJlR4g3rjD3DI3M74hjRhFRVU1zVk7L32wE
         chX2W3fKaiadct7YS8kv9ZoNw4H5SwnGBTCZhZbqJ1A7ilpRD+xlOlhTWglgedCEZhtw
         eAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        fh=EfwQuTFBSFxdASibV+yYikkkbJgIj8sdYyZMgbQdDvQ=;
        b=DEai+w4eKw+qbO4nfBOe7oOB7vgRD/jr/ij6jBuigTB6WkrnFQy7nPTcBImzgneDTT
         dvmW+mnWH2/wX2sxUj8iz22X2ywn8wriAM8F/Ua1twXFpi9mOGkVGTzLw1rcrGocNt06
         FsNtjD/ImTXmtoRxg/ODhp8oHThQbs+U2DWlS9dtHKYlbWcJ7OivRHLMDB0rIG2dXeO3
         HD5oyqgenE3fyRzJI7Xe0/P0OTOZFn839my7qH6GXw2ugWFwRM0KX5hyd0DHFZB7QGZ7
         qoSyZLYdSOb6DIasscGq/W5RN1KodJAZd3eaI/Lbqg/dYVv0FryX5iSCMmQaXVudWYvw
         bnsA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782305294; x=1782910094; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        b=LHGHNDjeYaAm7MgxySPdusGyR7LarhX92j+/qwtC5l2mM7PeQWMCunbAAUAc1noKmD
         sm/UVTijVSRCnGNOE/sfPsgnuBUQVsXtluD2rPEC2RCEZ9S1Fj13tl6MlAytLyjx5MUR
         Qsg5n2DZCRAATIMWsyJvXxPxE522oB6LU5uZp8bmF8lBX2lDy+mPpWgwydWk6cN2gnpT
         ZWeTSB15RKGSZGICMXtn1aAG51I1XsMeerC3Q7wOzzkNWfMGX+KBXmeMegN/mAChQLh9
         EKhx2mkrIu7e/zjSwa+uj+Y+WE7tdVdgkUe4sBfyjRrNQ6grSf66wOWTajwi09jLJB3a
         pwsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782305294; x=1782910094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3MWM4Rp4reeuC51yhNdvSwjoOhRN6bkNqY5FS9+XPUo=;
        b=UvV/ToBDk6wbOwpfPgxf1jL+VMuMBHtZ0vLet6Z6aqoww6sOgHMqBeyjEWtOv0IsIf
         hcrKOi7efyp+R3xxf/TyTjc4cs+A285UjAUiHAYkNXbYM2kHIUzcp2OkqannWZIbQpPa
         lKaKKZXpxnF+qbM2czy0AS7XbTDhF9s1e+W2HP4BIPzSaBGUV8ZS5GAuVoFHpHtsG1zQ
         6os3ZjtgUUg0VSkzM0F8n++ccvELgCgvXC4Wg+QjprIJBG3Tcv+TdBg/KIZQycUhMfFx
         53Afrhqj2F6MORtAWl2uNQJusvT0v+NwsDJoBrsZyZRsi9UTFJbCih1pjD6G5M5InzCc
         vWYA==
X-Forwarded-Encrypted: i=1; AFNElJ8+GpIvnNOjgmjNZSWQDQ3buy5g6+Q76pH0eBdFBspv4Go6IU400yiIjXpY+YcDY2Fd8siJRmFgffpUfbI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YypM28KriUdc3J/NlAa/P0NBw2yDmN1TWJBcajndrn02P3rvp8R
	+I8orlDGEMY7qPggt2fc06MSmGYXbQti1QLptcnBUzrwZ7VlC/sIpjuUvyfGK7bc69/9hC6Rb/t
	feAswaa/3MTey/XZGI74BrT20230eQgkX63PUK7bkWQ==
X-Gm-Gg: AfdE7cmvnkbcq6yu+sfoSLNeSS1YtO2MEhnwBfTb5TRM2KlOX58T/5GZAd9QZffDKKX
	Z+WaGV9fTdhPpVDBtte/xRJ1StT82IS/EM670nGVEbFoClSCsuIdVTGWH8tYJJtlFT6i9UNeztQ
	dQ7t/JWKL2+t3c/yCQU1f9PNtJwME0XIIAEtiXvueCWlBwqMeYrgF63JrydUF1WZWyLhM2TkOa7
	WLmE2TqN2tyIZetSNDXfbf51rE7qcGsbZHjbh/oh/A1zr8QwB2qOjBMv9FLE3c+3Ev7M9L4u4o2
	vKL3nKQdRSQcwQy8uo/aisjIx0HxoaBUpcCRfkht2UpxpXope2aWujNk/w==
X-Received: by 2002:a05:600c:699b:b0:492:6113:d4fc with SMTP id
 5b1f17b1804b1-4926113d5camr38002035e9.17.1782305293997; Wed, 24 Jun 2026
 05:48:13 -0700 (PDT)
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
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <73b2bd81ce70814612e6d3cb689c3296de742aaf.1782224059.git.gregoire.layet@9elements.com>
 <20260624-original-vigorous-mayfly-dfceac@quoll>
In-Reply-To: <20260624-original-vigorous-mayfly-dfceac@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 14:48:02 +0200
X-Gm-Features: AVVi8CeO23_9ds8O0yHhJLM3WPWltEB3CF7pRM6viO6egbyN_FuIGSRsMbnIPSw
Message-ID: <CAFi2wKbKr8FMcJeGWA5e1UZUTh2=LwYNkLEj6exd2as7=AcvVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: serial: 8250: aspeed: add
 aspeed,vuart-over-pci bool prop
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[9elements.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[9elements.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4304-lists,linux-aspeed=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:lkundrak@v3.sk,m:devicetree@vger.kernel.org,m:gregkh@linuxfoundation.org,m:jirislaby@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andrew@lunn.ch,m:jacky_chou@aspeedtech.com,m:yh_chung@aspeedtech.com,m:ninad@linux.ibm.com,m:anirudhsriniv@gmail.com,m:linux-serial@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[9elements.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregoire.layet@9elements.com,linux-aspeed@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[jms.id.au,codeconstruct.com.au,v3.sk,vger.kernel.org,linuxfoundation.org,kernel.org,lunn.ch,aspeedtech.com,linux.ibm.com,gmail.com,lists.ozlabs.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp,mail.gmail.com:mid,9elements.com:dkim,9elements.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CD386C1E83

Hi Krzysztof,

> What does that mean? How UART can be accessible over PCI bus?

It's a Virtual UART. Internally, it's two FIFOs accessible via
8250-compatible register sets on both ends.
There is 4 Virtuals UARTs on the LPC bus of the AST2600 and 2 of them
are bridged over the PCI bus.
So, from the host, you can access the 8250 register set on the PCI bus.

> > +  aspeed,vuart-over-pci:
> > +    type: boolean
> > +    default: false
>
> There is no such syntax. Please do not introduce own style. Instead,
> look at other files how this is done.

Ack. I will remove 'default: false' for the v4.

> > +    description: |
>
> Do not need '|' unless you need to preserve formatting.

Acknowledged

Best regards,
Gr=C3=A9goire

