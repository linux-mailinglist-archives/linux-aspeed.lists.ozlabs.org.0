Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B331E4DD523
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 08:16:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKb0N3g16z30Ld
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 18:16:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=MEbhBjVa;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=MEbhBjVa; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKb0J4wxgz2xXV
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 18:16:15 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id i8so6262787qtx.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 00:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=89OsK1h888j5O8PwwjdBMZbY6X+2qCZ2e29zwEkV4RY=;
 b=MEbhBjVaGSyH4xQnmIwIyh58Fmh2UtgxlC06Npo95ke4TckjjWIKNz9NGQ4BQ8bpvG
 4xUUa0ux/yv1EQIyymWH2BtFv/qbvnbDLlXdQNLgNffwF5wzJ3zJEbxe3se1DJb12jwx
 5HhYBoOTmUBC03oethUrcHYJKVpRgQRqKeM7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=89OsK1h888j5O8PwwjdBMZbY6X+2qCZ2e29zwEkV4RY=;
 b=C3k9lSHsK+/THEgi05KcJJgiPuYTcGEztZu30RIhRr1N02IMxVzmYVFRbtbqLj4dMP
 XfaAuVGfozG07uCvMn+cTUBsHiZOlune5qmxoEqfi7ptHMibV7oqv9p2bRUqHhaqIpWc
 c45Ijzn/vJp+W4hzeHGVwbe7F/0JpgEvZrKWiSEzPo3OkLPQarIltFUNWCg5ZAEBvTr4
 y45IviCETPrfLjUkicqCJZ4gf9i6kWX39WApX50BZFlctX2PF5sCA+bL4lBg7LfKmyGk
 fiSQsheuHwxpacxdlBLmcSWYmv5Pwjwv4IdQ3UyxsAAp1S5ZWdfEfyDzf7Ui3T8yqz1g
 IOjA==
X-Gm-Message-State: AOAM533uWutSHllm7uaI5rH4eiYgLnF77uiMi5k33LmtN3xq5gd7kU1f
 GF9nz1LMYnxoSssnGvJ3x1AS35tF0FVYbfWlT9Q=
X-Google-Smtp-Source: ABdhPJzm9GO33XtUnrpTB3lOo8TGbARsbhbHYemBU66G/o3pUDWxiu3Q+/qseAmrsX/uDjIlN9Eosn92J67SH2zprjU=
X-Received: by 2002:a05:622a:285:b0:2e1:dcda:98fd with SMTP id
 z5-20020a05622a028500b002e1dcda98fdmr6524543qtw.625.1647587771981; Fri, 18
 Mar 2022 00:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220310000629.119699-1-joel@jms.id.au>
 <20220310000629.119699-3-joel@jms.id.au>
 <CAK8P3a0LKG25Zu1X0m0FmSXpbC6YmWcvyhW1MOcw4XgnazS4sw@mail.gmail.com>
In-Reply-To: <CAK8P3a0LKG25Zu1X0m0FmSXpbC6YmWcvyhW1MOcw4XgnazS4sw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Mar 2022 07:16:00 +0000
Message-ID: <CACPK8XdunkxWx-Lb=9Gi7WnNfRyVtrsdPMnasNv1sBtZRxOmfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: soc: aspeed: Add secure boot controller
 support
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Mar 2022 at 08:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Mar 10, 2022 at 1:06 AM Joel Stanley <joel@jms.id.au> wrote:
> >
> > This reads out the status of the secure boot controller and exposes it
> > in debugfs.
> >
> > An example on a AST2600A3 QEMU model:
> >
> >  # grep -r . /sys/kernel/debug/aspeed/*
> >  /sys/kernel/debug/aspeed/sbc/abr_image:0
> >  /sys/kernel/debug/aspeed/sbc/low_security_key:0
> >  /sys/kernel/debug/aspeed/sbc/otp_protected:0
> >  /sys/kernel/debug/aspeed/sbc/secure_boot:1
> >  /sys/kernel/debug/aspeed/sbc/uart_boot:0
> >
> > On boot the state of the system according to the secure boot controller
> > will be printed:
> >
> >  [    0.037634] AST2600 secure boot enabled
> >
> > or
> >
> >  [    0.037935] AST2600 secure boot disabled
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > ---
> > v2:
> >   - Place files in aspeed/sbc
> >   - Check for error when creating directory
> >   - Print secure boot message even if debugfs is disabled
>
> The implementation looks fine to me, but I think the changelog needs to
> explain why you picked debugfs over a sysfs interface, and how the
> interface is going to be used.
>
> As a rule, sysfs interfaces need to be documented and kept stable
> so that user space can rely on it, while debugfs interfaces should only
> be used for development and never be accessed by applications
> that need to work across kernel versions. If no stable user space
> is allowed to access these files, what is accessing them?

I hear what you're saying, but we're now going around in circles. The
first proposal added a soc-specific sysfs interface, which was
rejected in favor of creating a common interface. The common interface
didn't get any support, and with the feedback being the files were too
soc-specific. You rightly point out that the debugfs API is not
supposed to be relied on as a stable userspace API.

Do you think we should revisit the soc-specific sysfs?

The userspace that accesses the files comes in two forms: a runtime
application that checks the system state, and some manufacturing line
scripts that checks if the machine was correctly provisioned. The
application source can be viewed here:

 https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-state-manager/+/51766

The discussion has lost momentum for me, as in practice we needed to
ship the hardware, so the openbmc kernel will support the version of
the patches that were merged there for the lifetime of the product.
This isn't a threat, but an observation that the mainline kernel
process has failed in this instance, despite the best intentions of
everyone involved.

Cheers,

Joel
