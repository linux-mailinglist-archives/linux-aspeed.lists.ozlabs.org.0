Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12925522C17
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 May 2022 08:09:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kykyn5znFz3c7K
	for <lists+linux-aspeed@lfdr.de>; Wed, 11 May 2022 16:09:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=eRq98BEN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eRq98BEN; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kykyk0sv8z3bbB
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 May 2022 16:09:49 +1000 (AEST)
Received: by mail-wr1-x435.google.com with SMTP id q23so1437266wra.1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 May 2022 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8VHraj8d06YM+De4Pnpm/ftVhB4j15aURh4OR3XtQQs=;
 b=eRq98BENscelG1cmv/7KdEfz37qy++0ZvRiGwjts7OYmQnJYTfoyhT12xutzugvRIb
 xA91PdIdQlQlYtyXshVyKPlGA29Ly68zQbYZW9BypgLRH6rgbm8Uq8OwhtQpGViAuWx+
 ir9yaQ3hCoV7+0wSmnwSP/4RSjOH4RY146Xmw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8VHraj8d06YM+De4Pnpm/ftVhB4j15aURh4OR3XtQQs=;
 b=jWHmIvIBHQTsdjRAxkKK2OgOsrYZXaAGi8VXVOCXmIUDBNdL5TFjrqO+w56yy17GsI
 45cuoSLZzNkc8ZcZ7sh5cXNMjnQSr6qzKUSCNu5Bj5XIGdUPjzAhT6YD8d6TOG3hGil9
 XBN6zTIei+X7jj3mKartJBnX4d4OECFtkJ5GsWXKDQn3J6Vpfmqz0uaEZIAAvdCeSPF+
 P7WWKUH/9TQAlsEUB35UFzm1OQRDGvcAVTDZG2PbLDz0wa/5bJuXTMuWcqmY2Ma8NMOP
 k5xJmxUWwDOgnloEWgwguGlQmPccm7Ih59YeRKcxHuzfi/cvNwI5+oJRQuMJUzqIqo21
 z13g==
X-Gm-Message-State: AOAM531swrbO953msbKysH8G+zdxpjyGm7pheAY8+VLlLkLoVtjls6D3
 n7vm7BXFJa1LWrG6iMd47cYJwpRP2emQW06RH44=
X-Google-Smtp-Source: ABdhPJyjDLNrgyQtYLmk0GuQSBajTH2voVldGLT2eHhEtoR8SqbzkHxfdWJfAsyGl8t5S9qpn5RGgyG9B1Gia/zSL8U=
X-Received: by 2002:a5d:6d04:0:b0:20c:52de:9ce4 with SMTP id
 e4-20020a5d6d04000000b0020c52de9ce4mr22646590wrq.572.1652249384925; Tue, 10
 May 2022 23:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220509151118.4899-1-potin.lai.pt@gmail.com>
In-Reply-To: <20220509151118.4899-1-potin.lai.pt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 May 2022 06:09:33 +0000
Message-ID: <CACPK8XfXbay7u5kMDgMoyDTO_Le2i4okNUG8sb8_NDepbPRjxA@mail.gmail.com>
Subject: Re: [PATCH 0/6] ARM: dts: aspeed: bletchley: update dts file base on
 DVT schematic
To: Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 9 May 2022 at 15:14, Potin Lai <potin.lai.pt@gmail.com> wrote:
>
> This patch series update Facebook Bletchley BMC devicetree base on DVT
> schematic.
>
> - EHCI: enable ehci0 for detecting and accessing usb device on sled
> - MDIO Bus: enable mdio0 for accessing switch registers
> - SPI2 Flash: switch spi driver back to aspeed-smc to improve performance
> - EEPROM: add eeprom node on each sled
> - GPIO:
>   - add PCA9536 IOEPX node on each sled
>   - update gpio line names

These look fine to me.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Patrick, did you want to review them before I merge?

>
> Potin Lai (6):
>   ARM: dts: aspeed: bletchley: enable ehci0 device node
>   ARM: dts: aspeed: bletchley: switch spi2 driver to aspeed-smc
>   ARM: dts: aspeed: bletchley: Enable mdio0 bus
>   ARM: dts: aspeed: bletchley: update gpio0 line names
>   ARM: dts: aspeed: bletchley: add pca9536 node on each sled
>   ARM: dts: aspeed: bletchley: add eeprom node on each sled
>
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 180 ++++++++++++++----
>  1 file changed, 145 insertions(+), 35 deletions(-)
>
> --
> 2.17.1
>
