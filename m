Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72293376AEA
	for <lists+linux-aspeed@lfdr.de>; Fri,  7 May 2021 21:58:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcLpl2nG6z2ymJ
	for <lists+linux-aspeed@lfdr.de>; Sat,  8 May 2021 05:58:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=PYWbUgy/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PYWbUgy/; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcLpB1RGVz2yXq
 for <linux-aspeed@lists.ozlabs.org>; Sat,  8 May 2021 05:57:35 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id z18so2229825plg.8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 07 May 2021 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uIAfCugvv6DirQSOC8Meh100tr5jk83OTp42czR55xU=;
 b=PYWbUgy/7guKQxkZCsOb5rWv0hyfvGf5JhVAeuu0AQvD0doZk6RvnW+Gg5uf1FDYsx
 AH/QnsVCrKgj2xiz+b4qzbuA74E67z7lRcgVciDIYE6VD7rwoYXc+d1DCxtUnNtzto86
 MkAQJz/4YdUX3xahIKFkOSY8wSsXPwhgSwMEjgt3N49+2vmYOdvrS5wThkuEqKlI+iY8
 fKZq9STvVxdflWMsFuSygBxxEMyOtF8EwiylWV4torqaTRoQwERAoNdYmTCg6k8nGMO6
 0zKbou5rO9PToGyxiahdKXDdqfubCm9bcsPpt6e6cjM7scpXoRUyTy2fZ/9UzG+Lga99
 i6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uIAfCugvv6DirQSOC8Meh100tr5jk83OTp42czR55xU=;
 b=pYtMN3YT711tlPIRHddqh6wCdLCIJS4MbMPNa+h+5ceEeZYC/in8FtnlgeVcwesSAb
 kQ/eSTcxMoq/QDT3DaLrJt0WnaoZEoxMAv7GDH/z9yb6biRyq9K51g1W5Zuz89l9wYLv
 6gGPeSxf20XWvIVk32pxnwGh7o4AsxRhRUE54M0IsoY2l1pfLgfRZ6+vC90I85bV/z9m
 kksDxtjmkYSCP8fol9EAKpoLh9F6p9URsn4WcQC+NkzgIpwdwQjsSI1twECLvQfO+KDI
 r/312Dy/uMhce9/mqtepqO7DjqQkO9p8ZHWWNdcPkXz71u9F7m/gbJiRrfw32XOvT/jv
 m9nw==
X-Gm-Message-State: AOAM53257LSBVriG3JSEP2sTr3uthqIk7o+rKWRGwcjepDgC9HGkFbfN
 wiWZjMj8RxWMmFjzWQT0TQzDhY6xNKqMYXWcoXry5w==
X-Google-Smtp-Source: ABdhPJz9wKX5WGS2h0k3XqhaJYqzyGFcZaZ4Q33Hno1JgZWxJwPRA4R0mdpWPLYUI4JNiIFvQg7KyW+HguEjm3YtvWU=
X-Received: by 2002:a17:90a:7306:: with SMTP id
 m6mr25318877pjk.217.1620417451576; 
 Fri, 07 May 2021 12:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210506205419.26294-1-zev@bewilderbeest.net>
In-Reply-To: <20210506205419.26294-1-zev@bewilderbeest.net>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 7 May 2021 12:57:20 -0700
Message-ID: <CAFd5g46TEFLWdBN80RxGwZfoyD-70C0pP59mhrynvD5ODd2wrg@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, May 6, 2021 at 1:54 PM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> The ast25xx and ast26xx have, respectively, two and three configurable
> slave device addresses to the ast24xx's one.  We only support using
> one at a time, but the others may come up in an indeterminate state
> depending on hardware/bootloader behavior, so we need to make sure we
> disable them so as to avoid ending up with phantom devices on the bus.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Looks great! No concerns from me.

Nevertheless, I am not in a position to test this at this time. Joel,
or Andrew could one of you (or someone else on the mailing list) test
this?

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
