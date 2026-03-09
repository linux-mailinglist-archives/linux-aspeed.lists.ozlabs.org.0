Return-Path: <linux-aspeed+bounces-3628-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6ARiAX5Or2noTgIAu9opvQ
	(envelope-from <linux-aspeed+bounces-3628-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>)
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Mar 2026 23:49:34 +0100
X-Original-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B992425ED
	for <lists+linux-aspeed@lfdr.de>; Mon, 09 Mar 2026 23:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fVByy4wWDz3c8W;
	Tue, 10 Mar 2026 09:49:30 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::102c" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773081707;
	cv=pass; b=TBlqeT1aWvwJc3p++b9iATNq5qeuPnq0MLJDDykjgeKZZWrmNkYhbnzKYJcJbgmceyvL88aS5qkeJGAgcmS3+l270b7VUr+M4fyKNWs3O6IdTD/QlrkM558b/QFlXdk4bAQWO4zCugRMlodRo55GAlqB0H78q24D/M0n9YkY638Ktci7F57/cCLN3MyC5XFVG80MnUsfjzzLrCEz7eucp4suJjRbBDvpuY6F19ez+x8RrrLwGkuvNI6KEx/b4KkwbtOLnIya/++LNriPm5pJ/Xh9YC7NWFGVgrzY/Yd8X/wTWbgwqSFBbH86H25LjM7EGEPRH4D4ycSuDh8hx5PRqA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773081707; c=relaxed/relaxed;
	bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSIJSkRlpDBQJwvEhQh5FvHM9alLHhnpRmWsEgsWziKyLdmq+VQrxSkrG1GEktcnwtDY4qjwAhWLdQ+78UGnfwSWaFl/ShTs0/YV+fd6LR/GB1T/9iOspGXZvoaJ3NiDsEdpdSwH4jCNIuXn8g+N4feHxadlS8Jg3ZcWUvqnK65+eJlgIw4wRPlj48v2GZieNIFHYPzbbcVj4SIbhQU8oc2xhunIeW6xGx+0BisIeX4UToI7QTF4Egz56C3M1E3QS5QpIzkE44sJn09o1kScul2BR1vSj8hZ/4Pw+UNTJiwlN3/TvoNWWlwCb0rHhGsaer7Jbquq18eWTwutuRW8lg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I3T9KrMa; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I3T9KrMa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=kevin.tung.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV5T60PdFz3c8h
	for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Mar 2026 05:41:45 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso6462836a91.3
        for <linux-aspeed@lists.ozlabs.org>; Mon, 09 Mar 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773081703; cv=none;
        d=google.com; s=arc-20240605;
        b=e1mKolbmv86HxcD1K726ZyUsd45uLxahWolbDIS+ZeigOcnntCYd1NrqUtyMGL4bGm
         VUQYj43/5vifxabHBh0F0CHuMXIWym0dO+ZbUbHtvgkbuc8ywEtYNc7lS6HX0xKCfdl0
         ECsUFhYQhS5iBQCCPogsjD8wobGv1jmskpzZMtGMMBFyitaVIjDfeiYF/AmK53HE5xOh
         x1QgiAWklcgS/ZxnE14z/F6HRTR40SpApAHeJfTw2ZPwNgGbVUxTZApQTmOrHYIYuUAu
         klkACqVGDInf4N7+z8QeYjNBZ6pXIcaxyFDla7fsHypF4Y6+0ZwfIfH5ZUudDreLQw19
         G1bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
        fh=8bnuJIP9ifglE7iVDBhYt0/cQ73VQGhYI3gA5qiZknQ=;
        b=FGQAqBaxhmv1sLOQldF2j0cBGOTF48Xmq7uAd8lPN6ptERk52LCOtK5lKSAaxZvqk7
         O5rc2eQCMDZqDKej7TgCXlhUvHg8AUcznZpIze+yyZbfuHSCDw8BGWaSpEAKWTo4DpwX
         i3xxBgDWcmU778fAhxrMzpcA1+q9lIpzwWYYLxjYzWVWUEtnPXiucFIcQpRX3nbT4QWo
         edMnRN+X13929u2e+cYFPJ6TJGTd+ZVeMMM2inrUZ1GjHdME7hEh6t0NF68Q4/K5hQk/
         d7qaCfCQSZUJLCHnOwaoe6PXUQadM8sfP4aBtw9YbscAgqwbMvpyuRWDcIrfSomkw3En
         /c7Q==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773081703; x=1773686503; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
        b=I3T9KrMak8Fd9cRN/dtJ16jysN7KV3fpBSELg26sB3K9wEhKULSp0gH+/fpLvc4LGM
         wMgxIl/hedsMTPee/p75of2RB2Hs2OGUf4gWctnCVh++Q5+q/n39Hx/AhsXxMExrQ2ij
         J20zAsGOV2eog95lA/OO+KhyGTWo1pWZ7gfU1g38E8wojNewJZoDFJLkYnPFOUQh11QD
         ut5nVAuFP40ParzA4g1opxqSu/TjyFbqhIvnmINrlLVpHFxquarAGKO3NjCHp5/cX8ex
         HzoLebdQJ0UQcYwhmLHK4bKLndT5kess0sPZLxcUmPGTemN2sw30wkeCLPSxs23MyvHq
         7BAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773081703; x=1773686503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PJfZbulraOO59O/eR/pHIsZdb8/5q9XObxeBXoWSK88=;
        b=wkfGvvwyG6vOvtf5r0h3r8F5LpbccrUInTRhvtsSjIg6geTiAVVw7PdmGg2fRYj/Ne
         FqGki2MYGN0WaBhrR/eORTJY5nx3Oe3XEWmUs5Y8DRSs1SgVIY6/y+AF2F0Nd8LbCIGX
         lVQ40QVch7l+PUtmQ1TyXIRL+91FaIh4VV4/UO+31wDkSJQ15HTxky0DuGfYF4VExAf0
         JYVpC9MMvCA3Ni840qkcqa+CZ6Z/av0Fp67KfuV8XnddmFd5zkiecy+axWTILL6xniWp
         EstGYbVKhThd2P5coQrlSJxtTQUPIl45l7OH2KV7yH5sXXSm7MuPFd4RNVBWE6VL2OT7
         U5mA==
X-Forwarded-Encrypted: i=1; AJvYcCUJRHQVCfQVUfI7jXS8MqHO0L24NRZMIEVU7+j/3ah0FgG96tzrKD8ZVJr5Y0zQMeImQM/A1OseMKKd7vw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRDKQxSZII0PWD3LPB28MKqQnMTeAjf857TtEs6lDAM1VHrpZQ
	iKm4gJEMKujIINrr+gGN17aPNDE5K5QTAReLacQL5KMBR3vSE07LjLENJAg1ToF0wQOvs/RQVJM
	ygupab+mw7XZrwy4vjdQHt24DzmBoYF4=
X-Gm-Gg: ATEYQzzLj5/mVlaln2T7tA+tJkaDIipq3stly0vLQqWDEgYljNN1puSzmIE8ojhrfkR
	jNKN3KaZF6Zo3RpTGhj2g+TC5XLMOHfXeE9W0zPJF+atV/Zfi7bVNS5NjS9AfVk++kMfhxKh06w
	vinINMKGsKrWZx5GYzaEXs+Oq7lnoSwm6VYqvCkAsAyw9OLw/1p4Vi1ISVvHoZe8j9sPmd4hWRi
	ZOhKd1ufKwKTqEhcWxyofs6J/XrR2p/jKXUxMpoNhtH/8Zr6x3BIdz2g/RrlP2eX03opOmhvRBR
	vJp4
X-Received: by 2002:a17:90b:164a:b0:356:2fc5:30f5 with SMTP id
 98e67ed59e1d1-359be2b927cmr11377904a91.13.1773081703130; Mon, 09 Mar 2026
 11:41:43 -0700 (PDT)
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
References: <20260223-yv5_revise_dts-v5-0-fc913e902488@gmail.com>
 <20260223-yv5_revise_dts-v5-2-fc913e902488@gmail.com> <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
In-Reply-To: <73ea41bf341df0e3215c58a029c9ea2386c4ef8a.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Mon, 9 Mar 2026 11:41:25 -0700
X-Gm-Features: AaiRm52uT5JRZlFgMZjCJC1DCOwOGUav3xI3jvI4TX-E-U-Zc80rWPyZ4TjKbeU
Message-ID: <CABh9gBd3b9TB1-s=Gq1q-M8bX+4UioXePUF0DPVrU2N3N8S9yw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] ARM: dts: aspeed: yosemite5: Remove ambiguous
 power monitor DTS nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>, Jackson Liu <Jackson.Liu@quantatw.com>, 
	Daniel Hsu <Daniel-Hsu@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,TVD_SUBJ_WIPE_DEBT
	autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 25B992425ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-3628-lists,linux-aspeed=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andrew@codeconstruct.com.au,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:joel@jms.id.au,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amithash@meta.com,m:Kevin.Tung@quantatw.com,m:Ken.Chen@quantatw.com,m:Leo-Yang@quantatw.com,m:Jackson.Liu@quantatw.com,m:Daniel-Hsu@quantatw.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-aspeed@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-aspeed@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kevintungopenbmc@gmail.com,linux-aspeed@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-aspeed,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo,mail.gmail.com:mid,codeconstruct.com.au:email]
X-Rspamd-Action: no action

On Tue, Mar 3, 2026 at 6:41=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> Sorry for the patchy replies so far, but this series bothers me and
> other priorities keep bumping it down the list.
>
> On Mon, 2026-02-23 at 19:17 +0800, Kevin Tung wrote:
> > Two different power monitor devices, using different drivers, reuse
> > I2C addresses 0x40 and 0x45 on bus 10 across Yosemite5 board variants.
> > Defining these devices statically in the DTS can lead to incorrect
> > driver binding on newer boards when the wrong device is instantiated.
>
> There are effective methods of maintaining devicetrees for variants.
> Why are we choosing to remove information about the platform rather
> than use existing techniques to properly describe them?
>
Hi Andrew,

This is due to hardware design changes during earlier development
stages, and the fix is expected to remain stable as the design has
matured.
Could you guide me on the best way to maintain devicetrees for
variants? Thank you :)
> >
> > Therefore, remove 10-0040 and 10-0045 device nodes, and let the driver
> > selection is instead handled in user space by the OpenBMC Entity
> > Manager based on the actual board configuration.
>
> As a separate problem to the one above, while you may run OpenBMC on
> this platform, I'd rather keep the description abstract. We can finish
> the sentence at "... is instead handled in user space" and remove the
> rest.
>
Noted. Thanks.

Kevin,
BR

