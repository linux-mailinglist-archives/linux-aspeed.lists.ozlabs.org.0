Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE65A7356
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 03:27:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHRPL5S0jz2ynh
	for <lists+linux-aspeed@lfdr.de>; Wed, 31 Aug 2022 11:27:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FZYEAwYr;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FZYEAwYr;
	dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGRzQ1hJvz2ynh
	for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Aug 2022 20:50:08 +1000 (AEST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-32a09b909f6so185752847b3.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Aug 2022 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=02up1+XGpVBi6AHgu/b3rfxqhl6KNaHX2V6z5XwpNUQ=;
        b=FZYEAwYrJTXa7MsPzOQh2xbVZi1FbFX9IcQNMRkqQdm9zbUnGHL/idtZB+Wq+Bd7qY
         k69FxQOyMPx8RL8rzQWnnrF67yiSpujwo6HL8Lq3ow7Gqb25hbVHnSWpUyjuqWTFAWIB
         MD3IpffnxVIyhMOTKTO4wEOPkxSkVoZOu9QH60SBKzeXDeP6kwq+7NsIIPr48LMNETz7
         YQMJmaUevpD+WacOBXcQav55ukD+LslXoHuhR/FTZ1WQEH7w8XLdYGyJGWryktR6Ex2W
         biPYNa2pdTXWI4J00/thRIi6wN2As4wpQvkK1qjPq6bcK1wqBsJ+47BFACy0KCnIMf4m
         DMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=02up1+XGpVBi6AHgu/b3rfxqhl6KNaHX2V6z5XwpNUQ=;
        b=BlNItPm/kjjTdeNCUhS9t8y0LQNDUDrEf+2ApI1NxfUNnFfpzjE1kWMAODbvUDeQ4U
         yd1+uhkWWsB4TVWkyaLgz/s/rsnUV3xPLfC8PGZI4qMVUr6PKgN8rxX32U099/4zmUrn
         GEtGmrWfqVwclh71NIu9oNwYgpvBe188ptXr6Q2NYBh7KrJSRW+ZW+gb6e2r4KBbqLCL
         OCa1/5fBiSuQnqI0o3UF7/TvdD0hbKsUXFdEYEIuMSuBOFRYJCiKahdBYi08F3042qV5
         tVesN7niUhauHz72WJoyMiqRi0mu6jPd25ORXt/LwZYPcuoZ4HM9NSDc+N3JqIX0ITWA
         E4qw==
X-Gm-Message-State: ACgBeo22RM3RCykGpOm0knMmc9QFHw/Ok9duSn+TZ8aKxhQO6RYpPaAs
	SATbKjpCUu3ZG87/Qf5nRYqlktJoGiWwpgH6rpQ=
X-Google-Smtp-Source: AA6agR6SKcxVKiwCDQPt+dP0L06eeP9L3P+uYhWmB35aaik/7nramB2p2rbW7TraVVfQlPcOhSTNk8A4YTSjFJy/9OI=
X-Received: by 2002:a25:40c6:0:b0:67a:5c8a:21d2 with SMTP id
 n189-20020a2540c6000000b0067a5c8a21d2mr8144310yba.158.1661770206527; Mon, 29
 Aug 2022 03:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220829072035.1539399-1-neal_liu@aspeedtech.com>
In-Reply-To: <20220829072035.1539399-1-neal_liu@aspeedtech.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Mon, 29 Aug 2022 11:49:30 +0100
Message-ID: <CADVatmNzj2XAPL5bA5JKW9gbMM7bUoOOqh=9+Fh4v79Z-=BjgQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: aspeed: fix build module error
To: Neal Liu <neal_liu@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 31 Aug 2022 11:27:25 +1000
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
Cc: BMC-SW@aspeedtech.com, Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>, linux-crypto@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Aug 29, 2022 at 8:42 AM Neal Liu <neal_liu@aspeedtech.com> wrote:
>
> If CONFIG_MODULES=y and CONFIG_CRYPTO_DEV_ASPEED=m,
> build modpost would be failed.
>
> Error messages:
>   ERROR: modpost: "aspeed_register_hace_hash_algs"
>   [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
>   ERROR: modpost: "aspeed_unregister_hace_hash_algs"
>   [drivers/crypto/aspeed/aspeed_crypto.ko] undefined!
>
> Change build sequence to fix this.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Neal Liu <neal_liu@aspeedtech.com>

Tested-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

-- 
Regards
Sudip
