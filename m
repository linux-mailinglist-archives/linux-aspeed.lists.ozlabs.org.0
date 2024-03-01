Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A278186DCE6
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Mar 2024 09:18:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mKjl0MF2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmLZX4hQ9z3vZB
	for <lists+linux-aspeed@lfdr.de>; Fri,  1 Mar 2024 19:18:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mKjl0MF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::a35; helo=mail-vk1-xa35.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmLZM0m9xz3bvW
	for <linux-aspeed@lists.ozlabs.org>; Fri,  1 Mar 2024 19:18:17 +1100 (AEDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4d33a041ebbso479554e0c.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 01 Mar 2024 00:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709281092; x=1709885892; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yp68DEdZUIp6DbHm5jT7o9JF91i5ZA3+8zf7cCaGH40=;
        b=mKjl0MF2s9Fk4SKymB5pG++LAwHdWUARIWiP45Z1us9gh72sITpfPu4dVcd1d/Vi1g
         fpHlax5Z2RiKTYwY9p/8pbCd2Kzd9oCLYR8JVcR50T2i7jVnsrOIJukzZJTTwra2RzTj
         X6v8YD3RigUVoZ5zneVglhcww6kpVruq0TNUkiV+zCfG0SPnJB/PA7/0IOoSKdW9PODc
         y7hD2N1NArKRioLsapKtnQOlsK+03IXhyKN9QZciMDPhL4aG0va04JDa3lkrDgqiO5QH
         q/iTY0qIJaRaLAkP9aP6qQTZJfbhkh8OgMUFZfIYbe+gLLtb7LzvWxzHlp0g6Pl37JZu
         D5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709281092; x=1709885892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp68DEdZUIp6DbHm5jT7o9JF91i5ZA3+8zf7cCaGH40=;
        b=hKxHxQA4e2rcmbD8klfTEk7eP9GBD+SQkigHLKsuN31yOwwGhEb4egPoazRxNtFNO2
         waTzcf7XcZGyfJhB1BL4RJAxeEDV2MJPVZQa56fj2SXh1EDGXLCnUueual5mNmPkv+9O
         dN03h/2HAkjNlGvE8+hKU580C/P38SujlPOuWKKfA6t5y1lV6CRi6RufgGaIc5/pFIXw
         1/Dl3/rbztkhKsAE5eXg21P1IsWjZtMI1j3ARneC4UvD51xL/GsdQlSQkm7IgSKFU4S2
         GMV15FnAZkLlbVwRY2COMLdm2mKwUkI8aucmONYogH4EK1hxRi7s+BTKnxD6POpCPLej
         h2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUwfCyZfpxlue77Oki2jvXpkE2BQfb1PnxJzt0AG/rHsGGAh27DfBehi8pPqGl5waZEXoNAcfakIR5Nj3XPfQSuq+wmht2N38o2hdjyA==
X-Gm-Message-State: AOJu0YxdsmgLOklk1nivS7KKH0LrsfzWBxWJRsS9cY+3n4SZyyxqmX9f
	JJb5lavgp9GqGlIG6T47qnbyP2Q2fhjXoeS+hDDZKoZQObVjqj/nqf5TwsZcw/0tIviXt3SPQuN
	gA3D8iJBz+5R9nhtWAKBAFUUgX2EFDzMcMp8Gyg==
X-Google-Smtp-Source: AGHT+IEhwqISmIJ5HCe1Nfu0Bnq1Pv29jU9DH3Pp2yv9SKTj1rghbwGyjrDqQbRbf0cdwpde2nH0FRgUZpSk6SGKDXU=
X-Received: by 2002:a05:6122:1aad:b0:4cd:b55a:bb0d with SMTP id
 dz13-20020a0561221aad00b004cdb55abb0dmr704388vkb.2.1709281092151; Fri, 01 Mar
 2024 00:18:12 -0800 (PST)
MIME-Version: 1.0
References: <20240228003043.1167394-1-andrew@codeconstruct.com.au>
 <c2060450-4b76-4740-afe4-d14717245f01@linaro.org> <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
 <CAMRc=MeEyo7y-G1saydxtTRedNtHPaEeLANuzXt6KsiDU2jOWw@mail.gmail.com> <e55aa1321ccac8e6391ab65a5a439b49d265bfce.camel@codeconstruct.com.au>
In-Reply-To: <e55aa1321ccac8e6391ab65a5a439b49d265bfce.camel@codeconstruct.com.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Mar 2024 09:18:01 +0100
Message-ID: <CAMRc=Mfa1uUhkPNpLdcMsGC4=G+_MGzaxXRL7UVdfKJD_zF0+w@mail.gmail.com>
Subject: Re: [PATCH v6] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Mar 1, 2024 at 12:23=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Thu, 2024-02-29 at 09:52 +0100, Bartosz Golaszewski wrote:
> > On Thu, Feb 29, 2024 at 4:21=E2=80=AFAM Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > On Wed, 2024-02-28 at 08:47 +0100, Krzysztof Kozlowski wrote:
> > > >
> > > > You still have way too many examples. One is enough, two is still o=
kay.
> > > > We really do not want more of examples with minor differences.
> > >
> > > Noted, I'll keep them to a minimum in the future.
> > >
> >
> > As in: I'll still send a v7? I can trim the examples when applying,
> > just tell me which ones to drop.
>
> Ah, thanks. I wasn't planning to send a v7 given the R-b tag from
> Krzysztof for v6. I intended for "in the future" to mean for patches
> converting other bindings to DT schema. But if you're keen to trim some
> examples out I'd drop the aspeed,ast2400-gpio and aspeed,ast2500-gpio
> nodes, keeping just the aspeed,ast2600-gpio example.
>
> Andrew

It's ok, I applied it as is.

Bart
