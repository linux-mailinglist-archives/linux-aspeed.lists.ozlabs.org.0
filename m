Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7EE39E7BD
	for <lists+linux-aspeed@lfdr.de>; Mon,  7 Jun 2021 21:50:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzP9m33w7z301j
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Jun 2021 05:50:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=NxHFgZcR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=NxHFgZcR; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzP9f5NtZz2xvZ
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Jun 2021 05:50:28 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 md2-20020a17090b23c2b029016de4440381so742492pjb.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 07 Jun 2021 12:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bv74AsRhD4whW+6rqcWVyhSDnu9tbc873ZsPv5yjLt8=;
 b=NxHFgZcR46dNJ/o9M+qgeUh0XvF6NiNhJJpHiHs5QY7FL6/gzr/emWrwtCDWZQD8Dx
 my1kh1hbLPuWtutLzJpqidHG7SuIeoJVt+PT0UbDc7GdBx1Ag00iq0OdhFL17EHKQftB
 MPENPRdmcoh+l0LkQmX7PQXAw7bflg/A0cELVjJ/sslT63Avr/c3//Qq0g7RlOq9Q1i4
 tceBwT4ki79pDtX3f9O9ZnWxhxsCaxAnlakdxB1i94ucGDEzAbCDk/Faok2gXnAbDGov
 xk5ZGIIeu+Z3k3GrgC2BTW6N1FJ/Vll4YJzXE+BxmJ6Il8Cgzqn3XxOAijFueSTDIQj1
 rzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bv74AsRhD4whW+6rqcWVyhSDnu9tbc873ZsPv5yjLt8=;
 b=c+oZ0yDAjWBLfYpKtp4pCSn0TJkDo8gwx8FR8qvecy4agRq6uigNN824f8igarF/HM
 uS+XOxHroOy/juyWFMU/gW2JwKUFHLvtpzu+64Bhg0iZ8w7LLsA65RkYYUl4aH6jprTu
 rdCveU+wegbNNQ7AURi3+7WiG4RMHY9dfZ9ikPqzgpndsTAi81QFR7EVjMLvBlA2he72
 XwpTRTkxR1RyfYeJge1fS5NzVLsdqgux18y/4GDy8fLG3sWlZdPkfxP/xHDCssIFG9kQ
 M+ii4yIh1AvlRoS0MeP1EVVjef05JOxGo4CALoJXfCsZHH8/B03tT22ZRswF7dVMQXFq
 /Cgg==
X-Gm-Message-State: AOAM532iPG/Jbwcqfit4MjtEh8ANOExd/uKY0WFOTPZ37GQGET49bVHq
 Nw0zkx1V54q8vG9jf6ClJPdmBIdc610F3HBVXIH3vA==
X-Google-Smtp-Source: ABdhPJyNfn1tfxkHDiti16wGlBjWWDwTONOD9MNID3zf+NVDwJNDQ5ly+dhTLIzNIaIlAeoT6OFTGxMTtfd8pWcmzN8=
X-Received: by 2002:a17:90a:b28d:: with SMTP id
 c13mr809342pjr.80.1623095418755; 
 Mon, 07 Jun 2021 12:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210602044113.1581347-1-matt@codeconstruct.com.au>
 <20210602044113.1581347-4-matt@codeconstruct.com.au>
In-Reply-To: <20210602044113.1581347-4-matt@codeconstruct.com.au>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 7 Jun 2021 12:50:07 -0700
Message-ID: <CAFd5g44Hd8LbSPCs4CT=KAh-Z5jwuc9y62yVh-azbc8OU+p56A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] i2c: aspeed: allow 255 byte block transfers
To: Matt Johnston <matt@codeconstruct.com.au>
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
Cc: jk@codeconstruct.com.au, Linux I2C <linux-i2c@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 1, 2021 at 9:42 PM Matt Johnston <matt@codeconstruct.com.au> wrote:
>
> Signed-off-by: Matt Johnston <matt@codeconstruct.com.au>

Looks good to me. I have attempted much larger transfers than 255
bytes in non-SMBus mode so this should work fine.

Excited to see some of SMBus v3 support being added!

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
