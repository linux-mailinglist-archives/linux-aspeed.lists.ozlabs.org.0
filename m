Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 398904D3D2D
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Mar 2022 23:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDRxc6TfBz3bWd
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 09:41:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Tse9BFaP;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832;
 helo=mail-qt1-x832.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Tse9BFaP; dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDRxR69fbz2yPv
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 09:40:58 +1100 (AEDT)
Received: by mail-qt1-x832.google.com with SMTP id t18so3217669qtw.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Mar 2022 14:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cPO6S9bluXJKkzWEcqKVpuNq+3y5lAfTmpSZoCT4ps8=;
 b=Tse9BFaP1/t1a8kFYW3+XcRuARS0+SZcsd/mpB5FPTqviCPiM1aY+ofqtzSftkWk6E
 CwoC54P8B5f4vQQ+I6rEPF7iuOmOqGX7Z/c94Ww1l1yUgEXz3xyHP5cjEwS3+JERSkQ1
 7/9Ih+rTmSpBHLqfOb/c9ud96JlL+Y1itdOUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cPO6S9bluXJKkzWEcqKVpuNq+3y5lAfTmpSZoCT4ps8=;
 b=CqeNTIJNbYSLBR6Y1PhLXGYcldg0e8sWTXm0mQGO9Gr/nbgUSWp3Zd16AVgwmYger9
 k7DueHi4zyDp0jDSGi/QCZcNU8t1Idpg5LldRpMlMSEw/JHHnuuMqjVFKCwhN7ceIcSP
 L/EuPw4nZggCDmZPCL2q3RzIvrDHe5Aze1Xc2WC+RNCZxFNUiq1qznoyO/ID2kSHze4J
 1UJd4nIScxp6oMkS4V31CtGZd7o3fNk84UZ/xBm9nXeHvvQmnqJfsKzxqRLfhaDoGOVY
 8ghl7gFTV2DEO0b4gafleo4BK/oQf46Hs5u8PetU0irOkQZ57/+QNbBTZdFrzTTn6Dai
 6PPA==
X-Gm-Message-State: AOAM532dzvQRElZdaBEchvL93lWsGa2F1w9TVKr6by57qypodUPdrwSo
 6FaYeWRVZ4IWbm5OH/k2m6ewVzPeSZqWK4GFodk=
X-Google-Smtp-Source: ABdhPJxyixEVMAt8ZgtV7eyWzbugAtDoDr11L7pxYukPVrJgyfh+0xtUt3a57elcSr7119gOcIgzGdwtA+3Xm8vRgdY=
X-Received: by 2002:a05:622a:1b8d:b0:2c6:59a9:360e with SMTP id
 bp13-20020a05622a1b8d00b002c659a9360emr1680111qtb.678.1646865654337; Wed, 09
 Mar 2022 14:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20220304030336.1017197-1-joel@jms.id.au>
 <92c2301f-5759-c13c-84f6-52ec69af7de6@kaod.org>
In-Reply-To: <92c2301f-5759-c13c-84f6-52ec69af7de6@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 9 Mar 2022 22:40:41 +0000
Message-ID: <CACPK8Xc+_hPU2wT10g6r2pKssTOdMB-xuCN7uL30rzNCLWWjEg@mail.gmail.com>
Subject: Re: [PATCH] ARM: soc: aspeed: Add secure boot controller support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Arnd Bergmann <arnd@arndb.de>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 9 Mar 2022 at 15:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> > +#define SEC_STATUS           0x14
> > +#define ABR_IMAGE_SOURCE     BIT(13)
> > +#define OTP_PROTECTED                BIT(8)
> > +#define LOW_SEC_KEY          BIT(7)
> > +#define SECURE_BOOT          BIT(6)
> > +#define UART_BOOT            BIT(5)
>
> Why not put these definitions under a common header file ?

They are the register definitions. I don't think there will be any
users outside of this driver.

>
> > +struct sbe {> +      u8 abr_image;
> > +     u8 low_security_key;
> > +     u8 otp_protected;
> > +     u8 secure_boot;
> > +     u8 invert;
> > +     u8 uart_boot;
>
>  From what the code does below, these could be of type 'bool'

I made them boot initially, but debugfs_create_u8 gets unhappy about
taking a bool.

We could use debugfs_create_bool, but then the files return Y/N which
I didn't like.

> > +     sbe.abr_image =3D !!(security_status & ABR_IMAGE_SOURCE);
> > +     sbe.low_security_key =3D !!(security_status & LOW_SEC_KEY);
> > +     sbe.otp_protected =3D !!(security_status & OTP_PROTECTED);
> > +     sbe.secure_boot =3D !!(security_status & SECURE_BOOT);
> > +     /* Invert the bit, as 1 is boot from SPI/eMMC */
> > +     sbe.uart_boot =3D  !(security_status & UART_BOOT);
> > +
> > +     debugfs_root =3D debugfs_create_dir("aspeed", NULL);
>
> may be use 'arch_debugfs_dir' or is that the same ? and test the returned
> value as it can fail.
>
> Also, instead of 'debugfs_root', we could introduce an extern
> 'aspeed_debugfs_dir' for other aspeed drivers. For instance, the spi-mem
> driver for flash devices could expose some internal settings like the
> direct mapping ranges for each flash device. I am sure other drivers
> would use it.

Okay. I was hesitant to export it before we had other users, but given
you already have some in mind I'll do that.

The hard bit is where to put it.

We have arch_debugfs_dir in include/linux/debugfs.h. This is used by
ppc, x86, s390 and sh, but arm doesn't populate it. Neither do any of
the arm socs.

We could initalise that to the machine name. This means we don't need
to add the soc-specific names into the driver. OTOH, "arch" is "arm"
not "aspeed".

I like the idea.

>
> > +     debugfs_create_u8("abr_image", 0444, debugfs_root, &sbe.abr_image=
);
> > +     debugfs_create_u8("low_security_key", 0444, debugfs_root, &sbe.lo=
w_security_key);
> > +     debugfs_create_u8("otp_protected", 0444, debugfs_root, &sbe.otp_p=
rotected);
> > +     debugfs_create_u8("uart_boot", 0444, debugfs_root, &sbe.uart_boot=
);
> > +     debugfs_create_u8("secure_boot", 0444, debugfs_root, &sbe.secure_=
boot);
>
> It would be cleaner if these files were under a 'sbe' or 'sbc' directory.

Ok.

Thanks for the review.
