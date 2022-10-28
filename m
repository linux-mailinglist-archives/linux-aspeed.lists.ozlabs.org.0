Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AABE610B7A
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Oct 2022 09:42:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzDyt3bSRz3cC5
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Oct 2022 18:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=RMQWpuAT;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::a2f; helo=mail-vk1-xa2f.google.com; envelope-from=yulei.sh@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=RMQWpuAT;
	dkim-atps=neutral
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com [IPv6:2607:f8b0:4864:20::a2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzDyl5wW9z2xGJ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Oct 2022 18:42:07 +1100 (AEDT)
Received: by mail-vk1-xa2f.google.com with SMTP id z186so2082012vkg.6
        for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Oct 2022 00:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ennOQKFOTwsP0hyLNdo0z1k0y6OG1jhsLXFhNIam/zE=;
        b=RMQWpuATlVIwbvb2c5IDualoj7xt9KjdY8SfP6kH7GH6Rp7kM+RSjQktoo5ZRwNoaN
         axAfzAi/ppoWLQp0umuuDbqW9yCjsQNeZM8w9TYJvN5Ii6RV6mpeS/CTkabzbjdUK2li
         4X9IuQetRuS7p0MMH7l6Uy7FSUCubxgHn2Y8bZoGoUVfew3y7Ovs8+kU39ZtyK++w8o3
         pFUMWM5Eh73tpsrFT5p7DWui+9qU3mA/k+7rZgQOgVL2YL65Oe4cPdMSR54rEKCvNx94
         TeZ2RRWBFDZ8y6oPlOlc2Et+dSDVErFGIyNH1X7yqQ1/7eiMMit2dHaUXSAWOgmSOSEM
         3w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ennOQKFOTwsP0hyLNdo0z1k0y6OG1jhsLXFhNIam/zE=;
        b=2SDHTODmJlfndmpkDcaerwAx42HeO1zAlQa2JRwN9FuPpPUWU3gbj84pk0GKB0xZpm
         fX3yy+p+WxCCREUB5LqYEoHCQlE8J4i81cerW/Njw/mp/zQ+q523xImavI9/fLU84TsM
         6nyw8DSAQcKsPgJQPxUp/2Jf/+0tHHUfhHgA2rO0Gfp5gF/uNxN/zxP/hyNGaSbHem8q
         7aJhdrdJDdvbtAknrKemgbmjuxhgF/Wbibnsq3L5Taw2DDAeHuaV4E1d1muF7+tH2snW
         inATlK/uxblxK9+kAtO2TZRsqTYymUv4mlel8V4tfofQB++m26SRVdacOQFXEY2gFic2
         FJEw==
X-Gm-Message-State: ACrzQf3QZwNJeXLfCq+UJqq2Ze1ngbmJiBSLYbWYjNUPmjw5sJpAGESv
	pfl1BnGxaTdtmNTTHOs4+VMLVQH3Hf0bvCYYoXbZiA==
X-Google-Smtp-Source: AMsMyM5OGqik8I98x+1T7m1YLDt44URvqhh31TER1G3asikOjsHwkZ5yg4Q1WSqd7twier+Ny5ZP2j+htkuzjLnc/QU=
X-Received: by 2002:ac5:c981:0:b0:3b7:c85d:cfeb with SMTP id
 e1-20020ac5c981000000b003b7c85dcfebmr4176168vkm.30.1666942924249; Fri, 28 Oct
 2022 00:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221024094853.2877441-1-yulei.sh@bytedance.com> <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Fri, 28 Oct 2022 15:41:53 +0800
Message-ID: <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
Subject: RE: [PATCH] usb: gadget: aspeed: fix buffer overflow
To: Neal Liu <neal_liu@aspeedtech.com>
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jakob Koschel <jakobkoschel@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Oct 28, 2022 at 2:59 PM Neal Liu <neal_liu@aspeedtech.com> wrote:
>
> Thanks for your feedback.
> I tried to reproduce it on my side, and it cannot be reproduce it.
> Here are my test sequences:
> 1. emulate one of the vhub port to usb ethernet through Linux gadget (ncm=
)

We are using rndis instead of ncm.

> 2. connect BMC vhub to Host
> 3. BMC & Host can ping each other (both usb eth dev default mtu is 1500)
> 4. Set BMC mtu to 1000 (Host OS cannot set usb eth dev mtu to 2000, it's =
maxmtu is 1500)

Not sure if it's related, but in my case (USB rndis, Debian 10 OS) it
should be able to set MTU to 2000.

> 5. ping BMC with `s -1500` argument from Host OS
> 6. BMC kernel no oops
>
> I dumped the `req` related members in ast_vhub_epn_handle_ack() to see if=
 whether the received data length exceeds the buffer length.
> In my case `req.length` is 16384 bytes, so it never exceeds it in this ca=
se.
> I'm wondering what's the value of `req.length` in your test scenario? And=
 how can I reproduce it?

The last 3 calls of ast_vhub_epn_handle_ack():

ast_vhub_epn_handle_ack=EF=BC=9Areq->last_desc=3D-1
req.actual=3D1024,req.length=3D1578,ep->ep.maxpacket=3D512
ast_vhub_epn_handle_ack=EF=BC=9Areq->last_desc=3D-1
req.actual=3D1536,req.length=3D1578,ep->ep.maxpacket=3D512
ast_vhub_epn_handle_ack=EF=BC=9Areq->last_desc=3D1
req.actual=3D1634,req.length=3D1578,ep->ep.maxpacket=3D512

We can see the last packet 1634 exceeds the req.legnth 1578, and
that's when the buffer overflow occurs.
