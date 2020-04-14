Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B121A76A9
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Apr 2020 10:53:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491fQk3G1nzDqbD
	for <lists+linux-aspeed@lfdr.de>; Tue, 14 Apr 2020 18:53:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=I5LbHdMw; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491f5Y6YPszDqTJ
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Apr 2020 18:38:25 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id b10so9410128qtt.9
 for <linux-aspeed@lists.ozlabs.org>; Tue, 14 Apr 2020 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0xdAHiCFihRgSLp4MeL+QyuVjJz44IkDYtH+659vR2U=;
 b=I5LbHdMwrfoPb6/2vuGUV7UJkwYId9FPaxbz4K5z/TcI6k9a2BqS1QobqQcdJ9WYMR
 gCS5qX4RP31kwwox1NVbv7s/pbokDRTD46jxLwUPLF8GuoX0057Pa3em9FhD5JVCbCph
 kXVZYeTk0B7/cWvVziXCIVjD8zsJcAldQFiLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0xdAHiCFihRgSLp4MeL+QyuVjJz44IkDYtH+659vR2U=;
 b=nk0pPa+WVHAf/++qh8wZmP+01mUTcA5k+392rBfp6jlLzSKfKBFj78j1/e6dBZcQX6
 zsNOkQhu/fihp/ThE/CGqkThGCT9qhBYN9VuZi1Rzh87SOIB+IJaK/Dwr81AXbUpQary
 lrSh2u+adf8aOyMxt/KO3EvVh2v8SzF0WoKDKRJbmWizSURXOOPAWC0/oKtPwFPX6xub
 1Y/w+bb08UeLWd7XW9q+Q/hOyuLdSVzu2tN+Xt61Z3eb796zlfcjk2gd4/6TyUvHOBu6
 CCyQTSV6OLlVRVpPxB+rScyYYzGJmjtH+TA81cXOMsIfVcrZ2qX16PJ+nUmTTTlA1chl
 AUKg==
X-Gm-Message-State: AGi0PuZv+oaPOIUAutzkygGNQpPR4kQdw/dZiNG6B4JMvEEZSL42YYYJ
 omoIeRt4p2jOSM2bv4QCQqQha/G5wumTxae2di8=
X-Google-Smtp-Source: APiQypLjKUx87bnfDDFyecwa1WRAy8ktBl1piU+R1+95G51JsyRpoV/L0aUcQSJFNSs1g4VMRsBAWxJfOHY/8suN09c=
X-Received: by 2002:ac8:36e9:: with SMTP id b38mr10223291qtc.234.1586853501094; 
 Tue, 14 Apr 2020 01:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcTN4PnifNTeLp71cnT5Ej_+zVB7yfAPDnPXkGHA0OiUKA@mail.gmail.com>
 <CABoTLcQE8r=yu6-doLoGmFgwFcJas5Y9gV-rar+2WHz_DjBuZw@mail.gmail.com>
In-Reply-To: <CABoTLcQE8r=yu6-doLoGmFgwFcJas5Y9gV-rar+2WHz_DjBuZw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 14 Apr 2020 08:38:08 +0000
Message-ID: <CACPK8XcYUaJ4r7p5Ve1dmAZx3QQhSHZiYt9=KoDZb0=SLDmZ0Q@mail.gmail.com>
Subject: Re: AST2600 clock gates
To: Oskar Senft <osk@google.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 13 Apr 2020 at 00:24, Oskar Senft <osk@google.com> wrote:
>
> OMG, I'm sorry. Ignore. I got confused between ASPEED_CLK_* being random =
identifiers and ASPEED_RESET_* actually being bits in the registers. Sorry.

No worries. The arragement is not straight forward, I'm glad you worked it =
out.

I look forward to reviewing your patches on the list :)

Cheers,

Joel

>
> Oskar.
>
> On Sun, Apr 12, 2020 at 7:22 PM Oskar Senft <osk@google.com> wrote:
>>
>> Hey Joel and Andrew
>>
>> I'm working on the AST2600 EVB trying to get some eSPI functionality to =
work using https://github.com/AspeedTech-BMC/linux/blob/aspeed-dev-v5.1/dri=
vers/soc/aspeed/aspeed-espi.c. The driver is missing support for clock enab=
lement so I dug into how this could be added.
>>
>> I noticed that you guys worked on include/dt-bindings/clock/ast2600-cloc=
k.h but from what I can tell the ASPEED_CLK_GATE_* definitions have not yet=
 been updated from AST2500 to AST2600.
>>
>> Am I looking at the latest version of the file? I'm happy to update the =
clock gate bits, but I don't want to duplicate work that you have in the pi=
peline.
>>
>> Thanks
>> Oskar.
