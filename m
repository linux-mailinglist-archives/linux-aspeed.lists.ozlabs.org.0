Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5413233BF
	for <lists+linux-aspeed@lfdr.de>; Tue, 23 Feb 2021 23:35:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlYm61Bslz30Qj
	for <lists+linux-aspeed@lfdr.de>; Wed, 24 Feb 2021 09:35:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=NkdjnqbD;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NkdjnqbD; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlYlf5cN5z30LG
 for <linux-aspeed@lists.ozlabs.org>; Wed, 24 Feb 2021 09:35:09 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id g20so10769104plo.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 23 Feb 2021 14:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6JxJtLrjQ/Nyr5fh6rK5tg3DDo4mCFKKxTbehSm9m2Y=;
 b=NkdjnqbDYp2asX/uD3vRQ3xJ5e5ui/iQKPk8pI5rD/D8Xtxmw2No/Kz1XWRqhbzLDw
 /SogjrCeHPL9ShRMpoV7QTtOH0mMtZVjDZmnkJrx3UkdwH5o6xAEhNcPWaylu5Jc/ki1
 cimr4KXEHNb4vfdUcsRygiPBdre52VB1satKujeT/rt7IbGM20tSs3Bu3m2Sz3ci1HKY
 yS5DR4R9jvvIbsnU3LUEP+drjhRNdq+W59KLQ/q0n2NVORBtdLSRCq7BhMvMp5jsxos/
 alRRmw+wZa8+VKmvudNcvbBUs8awZRQDY/o+V967jtgxtMd6Vorl11OYs4dza+AmYTAw
 HeKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6JxJtLrjQ/Nyr5fh6rK5tg3DDo4mCFKKxTbehSm9m2Y=;
 b=cR+JD57/BMO1gD8yjtcZjJkhLYExsAtPPhzso5i6FzKzDOIcNZoXv3h6Uygzn1CvcJ
 lniosZSWBHnmKXaqw+YKb3TPII9fL62bj8W55HOC2Nz43+Lst825bU2twBSNeujvCHxt
 MhxZWp6LcCnUx6OCh6jLIgo3Ghm9A+AVQGyLuw27O9lLrLMVcGqZJT4lq/2kQ0sKM3hT
 GN9fgw/lmbati+VV+X4V/hzIiwvqAOMNwZT58eOgGH+/0Wfi8OMjotGXNcz/GdRGRLs7
 aK1YimDt4nguMMVWVLpio6LJ8o672kWrAXL3p4nSXfU7ZKsy3UaHS/1qjlksVsJGL81t
 W1+A==
X-Gm-Message-State: AOAM5339OxPIBDpxTQ6mlaOnoQC0nrtZMSvpP5BgzVXrBTdYCm/Or6hp
 GRDEA5uKrptdLjoLeeK7qutNeeO0qJUDMK9TeIAsrQ==
X-Google-Smtp-Source: ABdhPJwffvRJctzUSP0CFLJEA0ALFcFH0gt4tYD2lVrQrJ56VkiXvtTQuK2R2zdN2Dtx0ceMdFzSuDeeuKCvkcHDWrI=
X-Received: by 2002:a17:90a:e64a:: with SMTP id
 ep10mr1093167pjb.20.1614119706521; 
 Tue, 23 Feb 2021 14:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20210216182735.11639-1-jae.hyun.yoo@linux.intel.com>
 <20210216182735.11639-3-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20210216182735.11639-3-jae.hyun.yoo@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 23 Feb 2021 14:34:55 -0800
Message-ID: <CAFd5g46K4=xPLFnvnAKY0MibU9s87Hd_OpYupYQwZ+Yq=W2-mQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ARM: dts: aspeed: modify I2C node to support
 buffer mode
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Wolfram Sang <wsa@the-dreams.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Cedric Le Goater <clg@kaod.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Feb 16, 2021 at 10:15 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> This driver uses byte mode that makes lots of interrupt calls
> so it's not good for performance. Also, it makes the driver very
> timing sensitive. To improve performance of the driver, this commit
> modifies I2C node to support buffer mode which uses I2C SRAM buffer
> instead of using a single byte buffer.
>
> AST2400:
> It has 2 KBytes (256 Bytes x 8 pages) of I2C SRAM buffer pool from
> 0x1e78a800 to 0x1e78afff that can be used for all busses with
> buffer pool manipulation. To simplify implementation for supporting
> both AST2400 and AST2500, it assigns each 128 Bytes per bus without
> using buffer pool manipulation so total 1792 Bytes of I2C SRAM
> buffer will be used.
>
> AST2500:
> It has 16 Bytes of individual I2C SRAM buffer per each bus and its
> range is from 0x1e78a200 to 0x1e78a2df, so it doesn't have 'buffer
> page selection' bit field in the Function control register, and
> neither 'base address pointer' bit field in the Pool buffer control
> register it has. To simplify implementation for supporting both
> AST2400 and AST2500, it writes zeros on those register bit fields
> but it's okay because it does nothing in AST2500.
>
> AST2600:
> It has 32 Bytes of individual I2C SRAM buffer per each bus and its
> range is from 0x1e78ac00 to 0x1e78adff. Works just like AST2500
> does.
>
> See Documentation/devicetree/bindings/i2c/i2c-aspeed.txt for
> enabling buffer mode details.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
