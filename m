Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB44ECE92
	for <lists+linux-aspeed@lfdr.de>; Wed, 30 Mar 2022 23:10:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTJxg0pgJz302c
	for <lists+linux-aspeed@lfdr.de>; Thu, 31 Mar 2022 08:10:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QVMx6GFy;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=QVMx6GFy; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTJxX0z4Tz2xVq
 for <linux-aspeed@lists.ozlabs.org>; Thu, 31 Mar 2022 08:10:38 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id v12so16698369ljd.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 30 Mar 2022 14:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=lb1kn+v2+pLgCmfWQC1dUPVzlJSnT0i2ptvBf+MuqYs=;
 b=QVMx6GFyXBCU3e36ae3Wkl0H0ziFH6nG7zZexUf0cIMEA03gTHgeoVe+s8Y0Aob9XZ
 lhJYD7yiqgEzdyd7ChUmnX3QLOv4BlO4uFOLCOes10UHH6QBDX5VJNlKm5BmOOO+Yvjf
 29Xj/pPToC4hE5lLwwA/S7Y5Rz1iDZNhdo3gCdjLNeXLc/2FdRkP/lrvdotHsiizpYkb
 dWHKOXdzs0NNY84sNghzh6uAmxxS9Dvg2zuQrQqsgke1zJU4XprSvigtIJMjzG97IM4w
 KssbL0GwXW6f7/yLnmAXHhsnEnsstZZSPjpYGwaaSR4SqVkK9EqebF6wSc4L0JQXijzO
 1XoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=lb1kn+v2+pLgCmfWQC1dUPVzlJSnT0i2ptvBf+MuqYs=;
 b=zWbK1cJI9QSPJhckCkGsQ3OSwjuu5ElgRCoBk7WLLwyQPTK2WleazXPhcZ/5LKYY2G
 DqS8ehbbHcTK12TisBqtYzmLkPbcrpDsMwo362cMcMG9qFt34Ws5cQAKZ/bPwWGjxKFj
 jii062a8oujDQLOAdXN/DQKGkiOVEZ9B8h6DlqESdy7JqTsz4G8h+CTIzT6gKDnlJKyV
 rpAN+o8uuWOmFWMHiLCyiFYt3aQBw+xmJhVygzKYZ8LetZuXuxbUNZYOZR8h3VUWvqhy
 tMDeKIqAlDzimr5DwVZSBQ+W0I/hRuLuMeZqnXe0ZViEttz9b5GufyBSqYVWABpO/blh
 rXag==
X-Gm-Message-State: AOAM532fC8ANZhe+8nNZ1TjZrUv6SscFBW/3PvylSgxbvs/bBZK/YjG9
 fM2Hygx+0+rHz9uvV5Ob4Aqt56bg2ilJEPT+74FVAQ==
X-Google-Smtp-Source: ABdhPJy+PIeZ4uVEh6ymBZamuQNx1YCMy4tRLCxI/cCg8XO0263mlqzucOnpDppPuPxcJjZ1hvExsy5BQ/rZVkxVnxs=
X-Received: by 2002:a05:651c:158a:b0:24a:f06c:7471 with SMTP id
 h10-20020a05651c158a00b0024af06c7471mr2118715ljq.198.1648674631715; Wed, 30
 Mar 2022 14:10:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
 <c29de2ea-0f60-4e7f-8308-11849a7de8e8@www.fastmail.com>
 <CAFPZpNZ1+UDVcEs_gp1zCzxXfP6PqZ8kx+UGhb73BusiScRk+g@mail.gmail.com>
 <a509d7a3-2551-4eea-b965-9499ada39b16@www.fastmail.com>
 <CAFPZpNb4fNF-QgQrWLeSkN9TjYsWZvH1YrbQj66rBW6jn8rCug@mail.gmail.com>
In-Reply-To: <CAFPZpNb4fNF-QgQrWLeSkN9TjYsWZvH1YrbQj66rBW6jn8rCug@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 30 Mar 2022 17:10:15 -0400
Message-ID: <CABoTLcSj0Py37E9tjC=0snep71Hg2bvTG8oGm_+wmiUHpTZL5w@mail.gmail.com>
Subject: Re: aspeed2500 SPI1 control at run-time with OpenBMC
To: Ali El-Haj-Mahmoud <aaelhaj@google.com>, Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed@lists.ozlabs.org
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> I can
> switch SPI1 control to master through pinmux-select:
> [...]
>
> However, I cannot access the device. '/dev/mtd6' doesn't exist, and I
> cannot bind it:
> $  echo 1e630000.spi >/sys/bus/platform/drivers/aspeed-smc/bind
> -sh: echo: write error: No such file or directory

Is there an existing interaction (in the code) between the Aspeed SPI
driver and pinmux? I guess ideally we'd want the SPI driver to talk
with pinmux to tell it "I'd like to bind the device, can you please
configure the pins properly" as well as "I just unbound the device.
pinmux, please release the pins".

With that, I wonder if we somewhat have that already and "pinctrl-0 =
<&pinctrl_spi1passthru_default>" ends up "confusing" the link between
the pinmux and the spi driver (since it's actually the opposite of
what we want)? How is that _supposed_ to work? Maybe there's just a
bug?

Also, I'm wondering: Is it possible to have "&spi1" defined, but not
bound initially? I guess that's what we want by default?

Oskar.
