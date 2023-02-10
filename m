Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6201C691B28
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 10:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCpCk1bxXz3cGk
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Feb 2023 20:22:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BGtIzquj;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ufispace.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=jordan.chang@ufispace.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ufispace-com.20210112.gappssmtp.com header.i=@ufispace-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BGtIzquj;
	dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCpCY491Lz3cCc
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 20:21:59 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id t5so3955351oiw.1
        for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Feb 2023 01:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ufispace-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLJ9kUfyKKHaAUOuvBcSKOFNG4PBe8Yek1lAbaYVe84=;
        b=BGtIzqujNvP5ygAUGUtaVYK1ma2XD5w88MoJBEH6cCZ/DwQqtw2pN0KqU9dvfNOcm+
         rhutDRysUEaZCaCquskxooDWSlxf/d1BiIqDg/AT8H7xrrUX3a6Nd4tbiRYWOCewB4Q0
         sScEXP5lFFkvaVdmb+i8hA9XPXH156sm9DYp9axgQjLUnbwPzqQatANIk1HI4lZ3az36
         MNQew1OY9G4r/q+CjLERXzRKwWnoywGmwkaS5P+IBpqlgb7WF5cmSgfoxhLDtM58Welp
         uuBKqcLSfw36MrMG0c7JUGkh0jQvq6FjsGfXafiRiPSruefpMzaDqA0L89tjLVrGV8j+
         PZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLJ9kUfyKKHaAUOuvBcSKOFNG4PBe8Yek1lAbaYVe84=;
        b=4D7mxI+sHFJnREF9pPXYsXBJVv50Rf0FQ0r/4CibVm34uow5ESsF6kLmq3IBEbNEW/
         BJoDJcwjXuyq4H9ExQDuTLctH7EaW9VsYXkH6lfUn8jsx5gdSCbQiJMxXnJcHqSFOtor
         s0djBFJWfUZEeL4w1iRAUVme4LxbGHbQkUcTBucwGVZIr9b6pVTeJ7D9PgsHvQDxJKct
         NrGKlAj/Y0POnodQmkA++e4HHKb+pef6XDqDT31y8zpB9XMTtbbazkyfUyUk4Owe+UZu
         zwJKruXfceM/Q52+gDBQYn+cIqzVy4VfsK8q9eOKE5v9Lbzl9GuAJVbl7njVppnV9L2x
         fzlg==
X-Gm-Message-State: AO0yUKXank4ewYtqSnDG1dRBn3AnU89s1RNVgSAvpYAnn++5u3SJtd+v
	cW9WP9/yJbV8YnwgbdF9d5GlGPddBuBV8Vod+AlGrQ==
X-Google-Smtp-Source: AK7set8C44utWhn3k0gZ0S4j9LEYnK479SBTtpKBr5/+G6jMC0jVZb7eMcTkoSXOmhB2KvQqikWf1SaF1JQiDYGkWMQ=
X-Received: by 2002:a05:6808:14c8:b0:378:7c48:f8d6 with SMTP id
 f8-20020a05680814c800b003787c48f8d6mr959901oiw.166.1676020912907; Fri, 10 Feb
 2023 01:21:52 -0800 (PST)
MIME-Version: 1.0
References: <20230210055451.72153-1-jordan.chang@ufispace.com>
 <20230210055451.72153-4-jordan.chang@ufispace.com> <4b735136-d9c0-cf01-e453-c8da31754a93@linaro.org>
In-Reply-To: <4b735136-d9c0-cf01-e453-c8da31754a93@linaro.org>
From: Jordan Chang <jordan.chang@ufispace.com>
Date: Fri, 10 Feb 2023 17:21:41 +0800
Message-ID: <CAJ3czeSeuPx1L-qkXFVLR+UQDyJHF_G4Z5MdoYSeLaifWNnn=A@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: aspeed: Add device tree for Ufispace
 NCPLite BMC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: jay.tc.lin@ufispace.com, devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, eason.ys.huang@ufispace.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Krzysztof,

On Fri, Feb 10, 2023 at 4:56 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> From where did you get my Ack? I don't recall it.
>

I misunderstood the usage of acked-by, please ignore this email patch.
Apology for the mistakes.
Should I resend an email patch or it still works on the previous v2 email?

Best Regards,
Jordan Chang
