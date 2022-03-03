Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7DA4CB697
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 06:52:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KrN557Qz3brm
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 16:52:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QZr291mC;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430;
 helo=mail-wr1-x430.google.com; envelope-from=petr.vorel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QZr291mC; dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KrF4qqsz30C2
 for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Mar 2022 16:52:11 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id b5so6078778wrr.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Mar 2022 21:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=fUvJ1FGslA5WYPriiaq2+k+CtDHNYAOxNSXhjt3sp7E=;
 b=QZr291mCokW7MzTSGdl2fadqzKN8rxrf/dmH1T2zr0agKMQqOJJtysLQqK+TTGnIBe
 h7uXHXfm4Nwagul4Zr6B+gNJEEzdwZQQyONFk1lNMK3fIl5aZ2miKG6NhRvzeytDg3bF
 Lv8Ty3692g+vj9NAt/rCHtAUPn7F4bqVr96ny7AT75P8QRNGu2ySJD7FT8/8BcL5NW9a
 hvqhPG0sx8xlAQba+s9cysmEG/3pF/fPlzoVsTZm1iFep1odleHDX7jK+KxYlVFCAk1N
 jBW7XpNHgq5hR/jgtiJ16H4Np+ADWJlq22CTSnRwLxmPDTEF/ztacm3O9ep6IgTgM5Lc
 PC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=fUvJ1FGslA5WYPriiaq2+k+CtDHNYAOxNSXhjt3sp7E=;
 b=0x1zf6NImS1GE0QMxXIP5KAyz2fw0X/Bnf32j0OGS8GQ/ta/M9ch6/koUkWUU5beqY
 cDU8HKAdtGLBQptLCjMepNlR4kjtqMy8StyH+bqRoTkFbF4ApnSDLV8if2ptZ+THbWkb
 kYqD3Bn515Bipw5gsR701CKJ2/6PRk+3IH8K9a1erymRSH4iQLXNdADmJ7RGFgGI6dpV
 TknLFVmLP2R8tokY8u1mvdb6R6Sege+7fKBB9RIzz8TrwQb9rG79vcNt6dK0e/kTPyQ4
 CIV1rKa/9Vx9TadphANe3XRumIWjxCuiFQzCzQbzncbvOtv5lH2MOMXP/dT9piUym9oC
 4t6g==
X-Gm-Message-State: AOAM531GaunUwJtB1G6flvUO5SsS5q43P6dwWmSzjxp+iNNH6BfLE69z
 1IvZk/FPDFrgu7TD8Me6X3YNENRgB5r58w==
X-Google-Smtp-Source: ABdhPJzKD6/TCvoRQhEUEmZxwgK3h/XwImRnSsHs96EOx80rEH13qgqPIiUbYiwxdBZnbxGlrCclbA==
X-Received: by 2002:a05:6000:1847:b0:1e6:2783:b3e6 with SMTP id
 c7-20020a056000184700b001e62783b3e6mr25371263wri.163.1646286727005; 
 Wed, 02 Mar 2022 21:52:07 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0037bdfa1665asm10299361wmj.18.2022.03.02.21.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:52:06 -0800 (PST)
Date: Thu, 3 Mar 2022 06:52:01 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Weiguo Li <liwg06@foxmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: fix null dereference in debug
Message-ID: <YiBXgV4mVYiJ2MxQ@pevik>
References: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Weiguo,

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
