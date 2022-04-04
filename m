Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD484F1853
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 Apr 2022 17:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXF3S67jsz2yPY
	for <lists+linux-aspeed@lfdr.de>; Tue,  5 Apr 2022 01:25:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CM7bruVN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=linmq006@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CM7bruVN; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXF3J5j0Wz2x9g
 for <linux-aspeed@lists.ozlabs.org>; Tue,  5 Apr 2022 01:25:46 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id 66so1097325pga.12
 for <linux-aspeed@lists.ozlabs.org>; Mon, 04 Apr 2022 08:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=C7kc0WBXzki7SKGLSUPjAVPvpQOiseE27/OA4Hb8PjU=;
 b=CM7bruVNar6ViIQtL5n44QYXZE1Uvm8jsK5oP95zGN41v0xkZ3xDN2Z0O1LhhLWcth
 yeHjhi+BLqb3YtgH9k8FJF8fHFLNgt92VqN9avK5xON8iKnrWLJ68OVH2dWAtuVclOt2
 zdDQ7u6f3kROW8veWKQgnCg7wfnfIck08sVMm4tQX2MUUvJfx350164m5clvR6NwOCii
 klydz0jLwiWkkOOlIB2sXoBsHLmq43RgWgVUej5+ZB7nxVRT2b05w5HhVP7i1DwMXwPX
 UqC5oA5oai9l5YIERIli0KXdpdTrzBI+gbvyVoT6BtUQbBNUT4Bc6MBwv9kN+ejPA5NV
 gkGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=C7kc0WBXzki7SKGLSUPjAVPvpQOiseE27/OA4Hb8PjU=;
 b=gvW2XmikSdJVnV6dfqANczK76vCNSi+Q1snMa5xIbXnleOfMTZD6zjYrJqzG/kVwTf
 y0HCXqReVR7t8k/VwZg36c/1h0gED0/bfK7kC0AYSXK0DG2tUzTPY7h/4uVDzO/g2H0r
 rsX7QMO1nNlH0tMXJ5OkdEH3snV3GGrM+C/pfXy2QYUSb81GrnGQi1XJQEXoe7QlgQrk
 CsAta0DNYyzojpOuxIfG650mjHKcSbMbm99wD3fTZYC8lBS9xWsCwIg/9MsTCdVPfJg9
 UnJQ3BbCeidHkW/H9YGl80uRhfKja69e6XIfABE2/3POKNaGfOmAxE9d2NG33PXYCGLX
 qlnw==
X-Gm-Message-State: AOAM531nQfVuS6jBJLlMyiHZuLyuhOUImMLxQsRD08/hJFgcDH241k6x
 fQHFtLY61CxSlO8HMEbF7FQ=
X-Google-Smtp-Source: ABdhPJyX1HGc5HkE1B4GZBABO2GZpRStGi3sYjqdjfv7Puk6FAmTQOSVQpHoLIdgEJmPNQaOj7MB3g==
X-Received: by 2002:a65:654f:0:b0:378:b8f6:ebe4 with SMTP id
 a15-20020a65654f000000b00378b8f6ebe4mr306781pgw.399.1649085944813; 
 Mon, 04 Apr 2022 08:25:44 -0700 (PDT)
Received: from VICKYMQLIN-NB1.localdomain ([106.39.148.25])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a63b951000000b0038644f62aeesm10772528pgo.68.2022.04.04.08.25.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 Apr 2022 08:25:44 -0700 (PDT)
Date: Mon, 4 Apr 2022 23:25:38 +0800
From: Miaoqian Lin <linmq006@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] serial: 8250_aspeed_vuart: Fix potential NULL
 dereference in aspeed_vuart_probe
Message-ID: <20220404152538.GA35@VICKYMQLIN-NB1.localdomain>
References: <20220404143842.16960-1-linmq006@gmail.com>
 <YksEnnyJDoL+fE5d@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YksEnnyJDoL+fE5d@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Yang Guang <yang.guang5@zte.com.cn>, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 04, 2022 at 04:45:50PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Apr 04, 2022 at 02:38:40PM +0000, Miaoqian Lin wrote:
> > platform_get_resource() may fail and return NULL, so we should
> > better check it's return value to avoid a NULL pointer dereference.
> > 
> > Fixes: 54da3e381c2b ("serial: 8250_aspeed_vuart: use UPF_IOREMAP to set up register mapping")
> > Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> > ---
> >  drivers/tty/serial/8250/8250_aspeed_vuart.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > index 93fe10c680fb..9d2a7856784f 100644
> > --- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > +++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
> > @@ -429,6 +429,8 @@ static int aspeed_vuart_probe(struct platform_device *pdev)
> >  	timer_setup(&vuart->unthrottle_timer, aspeed_vuart_unthrottle_exp, 0);
> >  
> >  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	if (!res)
> > +		return -EINVAL;
> 
> How did you test this change was correct?

Hi,

   I look into the implementation of platform_get_resource(),
and do cross-check the usages of it in the codebase, especially
the usages in other probe function. 
And I go through some simliar bugfix commits in the revision history——
add check for return value of platform_get_resource() in probe
functions，to learn the way to fix this kind of bugs. 
But sorry I don't have the corresponding device for running test.

