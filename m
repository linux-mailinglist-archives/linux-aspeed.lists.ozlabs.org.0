Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3898A1DA0
	for <lists+linux-aspeed@lfdr.de>; Thu, 11 Apr 2024 20:15:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z41hTUmQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFntM591pz3vYc
	for <lists+linux-aspeed@lfdr.de>; Fri, 12 Apr 2024 04:15:23 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z41hTUmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFntB1qhTz3dd4
	for <linux-aspeed@lists.ozlabs.org>; Fri, 12 Apr 2024 04:15:12 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ecff9df447so166120b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 11 Apr 2024 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712859309; x=1713464109; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8nM/5Rbqc0Ko6b717arrdCr2EqTMmE2AdERSDBdnW28=;
        b=Z41hTUmQ6VAqDFtTXbgfCrbPWtZ8EBF4Ub0y+wsNMGGaGKX+GkDu8loOXuU6ihHZOo
         B1DofFZhL0wHn8WAuoFTaVxha4xVhCiiTs28ieEgz+eLj12U7xngzEPaLa8WR7Y2jxaB
         LwRR5CvA2wVnQZUaJTu02U2PgUMSCnhrIi0bUBql4benH/toG99IjKcLYaffyqsTULh0
         NiPNKkUNB6hEXObt9OFbCpUFVWnfbnYkXXFM4CnM9M0q3YxNbnbTXpycKbY6knDWXAKe
         8gBWyCEoNurJdeVWpWkq2Uf6DY7dsyMxRo1nt5SGkTLYMRt1uNMsgZkHVYGiyrtRO/ei
         37jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712859309; x=1713464109;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nM/5Rbqc0Ko6b717arrdCr2EqTMmE2AdERSDBdnW28=;
        b=ZUf/LLefKcMaIziWdvJKFu+MOvevRRU9280IVS0uQ8O7AOcBAP3x6frygaRIEOuL7z
         OETl/QrdGnWNi+SHGkcGQiHMnhwGvZ01gq18dBEWeGoQNr+h8zC57Hzg8aqtCAFaA3ZF
         ch+VrpkztrOgBRZxoHYlLXBlKbKxk3cj3qkY7p/ZdWux4Mtso9K0bSb2sebDglQcUt7d
         aZRGNdJDs+ncEjmOHnH2vTMW29xl/9VXwj8lBU6DPoRYA/Q+fc2iFC7rDKNRcf2cJE+X
         lYm5zH08w2aB996uO1ZdQ2eHOVeeM/YHhBovJ3HtwU9/MlHrDRDPqLx1Xk1tiKuiui/z
         brZg==
X-Forwarded-Encrypted: i=1; AJvYcCVe+OBVZ4R3D4G00/yIWRP4jZ7lmSdnfroLYr5w+vcMeCN/qsf6Arxt0LjYSnhtITn/zAIy52druRWyWwnbUA47HdmbYICpGvgJO96iqg==
X-Gm-Message-State: AOJu0Yxkdcs978wJ7JJZqIz4OatLcPo0LLOKs7xcPKts70WHBpdb0AAS
	F36aukwcs6s7U1xW24vYPIu8UTenwqWNz2DIVMOELiZ4kwBB09mr8V4Jog==
X-Google-Smtp-Source: AGHT+IFEkPnym5HZi/cShkQEd/EVhXm/eFprr5GSIu2VtMtV2iB90prePI/rvjZ4gAhI2103K2mCOA==
X-Received: by 2002:a05:6a00:1312:b0:6ed:8798:3fa3 with SMTP id j18-20020a056a00131200b006ed87983fa3mr538860pfu.15.1712859308774;
        Thu, 11 Apr 2024 11:15:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h15-20020a63384f000000b005dc5289c4edsm1320302pgn.64.2024.04.11.11.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:15:07 -0700 (PDT)
Date: Thu, 11 Apr 2024 11:15:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] hwmon: (aspeed-g6-pwm-tacho): Drop cpp define only used
 once
Message-ID: <0787f458-c4ff-4498-820e-15e19796cbe6@roeck-us.net>
References: <20240411160136.247138-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240411160136.247138-2-u.kleine-koenig@pengutronix.de>
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, linux-aspeed@lists.ozlabs.org, kernel@pengutronix.de, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 06:01:36PM +0200, Uwe Kleine-König wrote:
> The macro PWM_ASPEED_NR_PWMS is only used once, just use it's value in
> this single code line.
> 

I am not part of the thou-shalt-not-use-defines-if-only-used-once
crowd, so I won't take this patch, sorry.

Guenter
