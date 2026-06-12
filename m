Return-Path: <linux-aspeed+bounces-4245-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id imdNDVheK2re8AMAu9opvQ
	(envelope-from <linux-aspeed+bounces-4245-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jun 2026 03:18:16 +0200
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74AC967617B
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Jun 2026 03:18:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IzoJoy8H;
	spf=pass (mail.lfdr.de: domain of "linux-aspeed+bounces-4245-lists+linux-aspeed=lfdr.de@lists.ozlabs.org" designates 112.213.38.117 as permitted sender) smtp.mailfrom="linux-aspeed+bounces-4245-lists+linux-aspeed=lfdr.de@lists.ozlabs.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("lists.ozlabs.org:s=201707:i=2")
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4gc1q72qSsz2ykX;
	Fri, 12 Jun 2026 11:18:11 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1781227091;
	cv=pass; b=JxWVk8eO4w6UlYopz96u/a0tuHAFizOP8JEXKnbzDsJdcPCJ5WLrdvAPNaLQloNKDJJ8Gtgc48NjxsL9TLP2EQewhOIDZgoDwXSLhMGOD4Zp5+gNnjB8Cr2smLj0txkok3ZwW9RgoE+Ahv5w9U6tabaiyaPO6RCT1BWlFiUeaIKSWbEhrYHoThwMMyyqgtczuqKFnWdAORs/V9V4P2UBCJz5IvFjcMu7ze45R3bI3Seq7PEYhtUDwLsOvtQvY8tZ800PLHSF1IeVyfh4bzGejKarSRwAlRpJGe9AYAayl6253etkBLbcDxjnFJxadfToMXPzrUHLLBfREYSGl9ikJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1781227091; c=relaxed/relaxed;
	bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LZ6AkLIsEiHK7R+5JnH95KUTsTMqi4UNTwTz5TcgL418hhTBBTbQ28U1mARpWgyf3YkRMoX6iMLyiMXPWTMPoh5k2S07zeqgEIb1/10MxqxaOqPj0AYSNGfVVbDn42ptxKr3oO14SB6PNrcx12VQiEmxaitPMR/ITiOVKho70LEkZ+aBvmNreNx06JHHohbwSu+fCpG7IjXXFR5ErgRwxkEM76m2U2DvhQLzUbaY0vzvw7I0hURlV3PBJPPWPFt2QC4mDl0Jiioq/eEYjyOy1Ee6XLBdWgH8w54WdveP0aShn7HGt2Zo8ud0stPywoHBqETNrZknETMAh02BPDAMGQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IzoJoy8H; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=kylehsieh1995@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4gc1q41gpWz2yQH
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Jun 2026 11:18:07 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3965bc493caso3877161fa.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Jun 2026 18:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781227079; cv=none;
        d=google.com; s=arc-20240605;
        b=h1PnjqOaU+yTuv4+ryK0Fj/ASXvEcfaDu/57yVmqFU0r8jfyZYyBL6MrSC1XPpymP2
         0vRkyrBt/75YwrqOXRJq1mq42wq9RaPHU9uporkl+LshBl8uMDkdxCiZh5Q9ir33OAGW
         n1jG6lmTw8dggVLX9WSPDKfBxVvxt73+pbd3mSlqEcIQcNHvYtfbM/0Ih2lkqKZTLb/n
         2IdpSjAKPZUO6s1UGn0BIVA10kePsf8MgvbUXCodjSptKi4Z9kHWd2udXNwaBQidJg3J
         qHCkJjVAYhqf9TsfL3lxhesl+FM0bxWzX9bfMf+Yewyy0tS3dWZs2AUED/tblfxltFSz
         46wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        fh=KQgq+9VnWL1b3/ZsDZ49ln/6AgwJ5T5OajvEbaFdPMs=;
        b=FoT6LqkuHJhWiCEMRIY/YiWmEHvsk+tzCbFsZyTp4H3u8FfXhp65bpiG7NRdiPl0AF
         eWmZB/YiffLH7qU5un1rBnJmbHRvuwcxqPthVKlHyAj8jTDo7+pC23cynR/3NQdf+hJy
         UpCYsGCNjLgLM2neDQkhySRwVsM07XG4Zm2KfjfNiAwlz3VqcZxpYpE7czy11d62zneO
         U5DvJ6fgRFSAbJYtLok4WTBcKrqWdiqGCSreiSca7JEWPGb+qmaC3NUUATsjreMyo9iC
         FcU5loUa5E7zElKlB/JzAgu6blxeNd9eqGl1Tm2pr35rvqEj5xuGfqszQRNhk6FMxZIn
         zvXw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781227079; x=1781831879; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        b=IzoJoy8H6991rMD4iTE1s5xVhKpIXemznyedxlDHOw8WTIZr+OZVXpCZHJ6BZ1wjvV
         LQ53yHtoVFO3ZbEDYsTk5+sU8RzvUveYMiDtpr6piVDocqk51cmcSa8P11WxHiEX1xkY
         a7pihXhTXMZLQSYczPCIAnGnKOVJNglvFuLUnpfe0bb9CJ9D6kAWMnsEJuiEGwellfq9
         kOhHNdnHicV6IM59e0iF07TlJugXZ0LHpsupNtAy693aNGDqcEejYXGaeWHCVu4wlNF7
         CbRNWPsO1E011vSHcNQl7/dh+W/U/E49O3YEthIWMud5jhGjwTUngiPk/YvG96SmX0xG
         UECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781227079; x=1781831879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cc3iMFUn//oP8yDxcu+EBcaVb7FwW2+8uzE8Fd2fpu8=;
        b=SWE3exSWK1p39rXqgKEF8ZY3+dbSJeiYvUABcexMPj+YwSlkblK7mY0Ukt2W7oD+R4
         OomuVDX+NMAy2QPv94eD0TlkJzMsu5KEjAcxWBnmwqrZT0Y7N1eFT0lcwom8CsXCJVAW
         5KWFKCqbFlYmWDdn5cv3jXb8DDfrACW2KTmBB5EClYtvWbfDz/X+n/FGs441hl7b7fl5
         EKXKwWRUYnXuhNYnPGuV1yjsSKdg/qUHciTWN19U+JJ3AsYfZKHic7dM+0YJ3Jyph7jY
         84Idh0VPexw757wJmGukqzyECR7Yg+OvR+6yEhy0FJwBRscPebpdgH41v4hucIrPWOwC
         Cpfw==
X-Forwarded-Encrypted: i=1; AFNElJ8Gps4CfBv00wct87ISm+ZrWds6Yf6y8QnvK120D/iTZJ1HkRc58c02v10Ke6iH/A55aXGM11PtzyNdnjk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqwXnq7THnMpWWtx8d7EZUFY7tnvq4omAyjRnr7UL8MRuFmxZc
	LYn1hsvbffjaqvn1TLiRXvlDYODwtkDqMkCBwRGD0Z4VpZLfovjcI7a9TQha1j52+gFoMwgqgL9
	HK1I6ab8HhY387RFwDr4qZZY9xhlk/xM=
X-Gm-Gg: Acq92OElcXE9CAhwgKZKI5MFNZa7i5xcU/9TFTOZr868tz05Fd/Eye0kCA4OrmaJAaq
	GRFGeQAoJslpiHWOw3GR2eAnjsNMMJm/NJFefhT15QIi74lcrc1fw1kcJGUyDNrcBnq7lJPxKep
	W/wvNm13WwK7FDhhKihU24wiBkg8u15JppYbRPoUP+RLBIWlrzwzRGDnm1fv1Bcd76g3ogi6XAC
	u7rN9X+2WIGXzTqHHmI76RBEXR6+kSJa/Y6pPA1UBbPx40aJpwBoFNdUGl1yrAc6hzJx3cMKLKi
	RRb/JqIM
X-Received: by 2002:a2e:a99a:0:b0:396:7927:2d14 with SMTP id
 38308e7fff4ca-3992afbd66dmr1406371fa.8.1781227078553; Thu, 11 Jun 2026
 18:17:58 -0700 (PDT)
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
References: <20260611-ventura2_initial_dts-v7-0-a61d8902bc5f@gmail.com>
 <20260611-ventura2_initial_dts-v7-2-a61d8902bc5f@gmail.com> <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
In-Reply-To: <843dc0ff-a504-4237-b0f4-d92be07e2465@lunn.ch>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Fri, 12 Jun 2026 09:19:28 +0800
X-Gm-Features: AVVi8CftlH_ekg-tghtfw6NJS5VaORcKvffCfG_52e7muOzHwhtMeakE4Fesdbk
Message-ID: <CAF7HswOi3fPMFppPoGmh0QELiPz4Po4cyWuDrEHLY2vNMyKE9g@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4245-lists,linux-aspeed=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[lunn.ch:server fail,mail.gmail.com:server fail];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[kylehsieh1995@gmail.com,linux-aspeed@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:andrew@codeconstruct.com.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kylehsieh1995@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,lists.ozlabs.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 74AC967617B

On Thu, Jun 11, 2026 at 11:57=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > +     /* Marvell 88E6393X EEPROM */
> > +     eeprom@50 {
> > +             compatible =3D "atmel,24c64";
> > +             reg =3D <0x50>;
> > +     };
>
> How is this on both a host I2C bus, and the switches I2C bus? Are you
> using multi-master? Is there a GPIO to hold the switch in reset while
> the host access the EEPROM?
>
>       Andrew
Hi Andrew,

Thanks for taking a look at this.

To answer your questions: No, we are not using multi-master.
The EEPROM is physically isolated by a hardware I2C multiplexer.
By default, the mux connects the EEPROM directly to the Marvell switch
for its routine operation and configuration loading. The BMC's I2C bus is
physically disconnected from the EEPROM during this time.

The BMC only gains access to this EEPROM for out-of-band firmware updates.
When an update is required, the BMC or CPLD asserts a reset to the switch,
toggles the I2C mux to route the EEPROM to the BMC, performs the flash,
and then restores the original routing before releasing the switch from res=
et.

Therefore, there is no runtime concurrent access or multi-master scenario
between the host and the switch.

Would you recommend adding a comment in the device tree to clarify this
hardware isolation, or is this explanation sufficient?

Best regards,
Kyle Hsieh

