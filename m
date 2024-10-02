Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A59E98D12E
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 12:27:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJWGN1vMtz2yWK
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 20:27:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1034"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727864857;
	cv=none; b=DsxaSO4dY8qBNz0JFeF5bpHFL938FqdvcccJAkt/tiRo1W8dIpNyE0zKd52dQKX49PCV7/jp5WDdCIVlNsmQ4seK/hRiEK8a3EmeuCPZpio+0N8gyiqfXVAw6qJdlw5Rbas+wsrbywkHyQz+CCMZHdUhR5SnQHvles6HPnRI7b/IF1j5JNyzKUd1JMeznnBigYc/pRw5MbAvBdFHUtAnkPgKcF+oHtswa7TgpWNM5d85j2kIRPxGhXD4ukJQDa8PszACPIr7O4AzgcxxaT6HuxzBvrdpytYVVO540ZZaq3gLTaJEBqHUiIBedjDH4fOt7PNvfQtWhUt1Y/IfM8y4Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727864857; c=relaxed/relaxed;
	bh=QhP8dAfjWNSaYUmoZ4flnUlLOBgW5BBKq7Dys4CJcPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bL1U8WlYI3znqqDfTi4crbZOWhV0CE9YY+8z0M3yv3iDB9A7sr3ad2lTX3Au158reIGonGAjE3vVbaQOshrbrYQS/W5s2QRI3MzjFAN+7m3ScGGM/NEVYE3X9PI6eLeTc9Y1yli/Ey+Rq1jilJIZTfiOFeOAsW14f373yfgEK36686yy42ApPW1psjZ6Xa2x+oush6Qa5Eiz/Aq7TySP337jpwpnHzWc3+sEmz32vdWyNI3r2ISOdyDUGmwTM8FfiGEaAPuCFxWAyEpmoLo6kE/87aPiIvD097GXyd4KfpJJEn0fsRqfMhW/JN5KnCRz+zxtX1ACqOJqyHTQQXrz5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=I4kq7sC6; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=I4kq7sC6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJWGJ4Pqjz2xl5
	for <linux-aspeed@lists.ozlabs.org>; Wed,  2 Oct 2024 20:27:35 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e09ff2d890so5493166a91.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Oct 2024 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727864852; x=1728469652; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhP8dAfjWNSaYUmoZ4flnUlLOBgW5BBKq7Dys4CJcPU=;
        b=I4kq7sC65xAxd0FNstLQNoLQFyStAFVijwvYhsNGRmWIfRawoWOblbvRaLhnknQGck
         aj4kZyXHjDgkYpmtoFifuohFTtSLaSMWI9Xe4jgbYMRAhCR5d5h8uOqh1+VUyz/aoQNa
         l4w+TEYwzQ05DdnZmi9C7sZcPgE3jZIyh9VaBTAR9A1apMWn7Oxtef4o6sOrexDgZOU4
         5nOgp7TQRsx8paNHLtoxWcVYkqN7bc/1cCCm2HY3DbqSuexUmQwamVD/p6TE3CajvXOI
         uK4wKyfbPWZBGAekRkR+mNS54DxmM609+5YkFUUHnOb0DUN4w1qTm3oRPkRbd8KudMDR
         RzOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727864852; x=1728469652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QhP8dAfjWNSaYUmoZ4flnUlLOBgW5BBKq7Dys4CJcPU=;
        b=gsXkQCz0hPPMVBYGoNYbjYlctVdfCG0tEjIVNRDP7k8hAfvoiM4AthD/nFnt46159c
         ftc5yWqUiWaHEvfypMkLyaZc7R63x70XopbWBXqQSQR4OQH1zPNNqayYg3EQJvA8Wbbz
         OeO7SyqxZJwZfr6LyGJsGXjLqsClKFJko9/ZjlCsBE0GFMwd0xMzAoWT5OnSnZpb9/Sy
         ltkOFkOZ5lX1CX6YnRGYXxU9QGkdwxQA+NvHgCq6VZBeIz1tuoAIVI+ypNHuBY3+9JQC
         BUV36ZsYsQeZrxp85ZHYexITNQ7ownQBd8o+6QaiU0sMfnWHkatBR9KHMiwGKWznhTKG
         p+Fg==
X-Forwarded-Encrypted: i=1; AJvYcCXJBreVgxqOyNQBYl8qZIAoMJPeOGfy9YFfkU4bZbDU9u0xhveK1O9t6kZqIwilFTv2EM8Wh9gcm4vOhIY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJTj3ChpOxlqByKg3uGpKgdpKse9YJxoevNYk6TjpgWujFzOm4
	3kpvuXqACHUPe1hSPOdPHpPIHfA++cX9u9532XYgxxH98f2uIpJJtPMRpbQ5+1yJaT5XlTWf5eZ
	VNDXNDJoZSjzFbqwdnFxCOKRyR2Y8RYzfVfX+4w==
X-Google-Smtp-Source: AGHT+IGiI611bF0LSNL9d1Wo5FWjadPESUy6tI49+wZGoCskFJasqOAr97AM7LwOhTLXYHQPCWHSierz4rQt1kIywXA=
X-Received: by 2002:a17:90a:ce84:b0:2e0:788f:6253 with SMTP id
 98e67ed59e1d1-2e18455899fmr3665606a91.10.1727864852193; Wed, 02 Oct 2024
 03:27:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
 <20240919094339.2407641-7-billy_tsai@aspeedtech.com> <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
In-Reply-To: <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 12:27:19 +0200
Message-ID: <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: robh@kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, Peter.Yin@quantatw.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Jay_Zhang@wiwynn.com, BMC-SW@aspeedtech.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Oct 1, 2024 at 4:18=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Thu, Sep 19, 2024 at 11:43=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtec=
h.com> wrote:
>
> > Performing a dummy read ensures that the register write operation is fu=
lly
> > completed, mitigating any potential bus delays that could otherwise imp=
act
> > the frequency of bitbang usage. E.g., if the JTAG application uses GPIO=
 to
> > control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the applicati=
on
> > sets the TCK clock to 1 MHz, the GPIO=E2=80=99s high/low transitions wi=
ll rely on
> > a delay function to ensure the clock frequency does not exceed 1 MHz.
> > However, this can lead to rapid toggling of the GPIO because the write
> > operation is POSTed and does not wait for a bus acknowledgment.
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
>
> If this applies cleanly on mainline I think it should go into fixes as-is=
.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

I agree but it doesn't. :(

Billy: please send it separately and - while at it - use a C-style comment.

Bart
